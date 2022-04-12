import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../responsive.dart';
import '../../example/project.dart';
import '../../widgets/Header/header.dart';
import '../../widgets/Cards/project_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Create FAB and put the Share plugin in it
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.share,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: () {
          Share.share("Check out Simon's portfolio website!");
        },
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Load the Header widget
                  const Header(),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Projects",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Load Responsiveness to determine size
                  Responsive(
                    // Based on the size of the screen, pass height parameter into widget function
                    mobile: mobileTabletBuilder(350),
                    tablet: mobileTabletBuilder(450),
                    desktop: desktopBuilder(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget mobileTabletBuilder(double height) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        // Load the widgets for the projects
        scrollDirection: Axis.horizontal,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          // Load the project card widget
          return ProjectCard(
            project: projects[index],
          );
        },
      ),
    );
  }

  Widget desktopBuilder() {
    return GridView.builder(
      shrinkWrap: true,
      // Define the grid when on desktop
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 5.0, mainAxisSpacing: 5.0),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(
          project: projects[index],
        );
      },
    );
  }
}
