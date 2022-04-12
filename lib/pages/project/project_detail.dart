import 'package:flutter/material.dart';
import '../../responsive.dart'; // Bring in the responsive class
import '../../models/project.dart'; // Models for the project

class ProjectDetail extends StatelessWidget {
  final Project project;
  const ProjectDetail({required this.project, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              // Create Column for the information on the page
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Create row for back button, title and year
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // .pop goes back to the page you were on before
                      BackButton(
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        project.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      // Container to give the year a background with style
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          project.year.toString(),
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // The image for the project wrapped with Hero to finalise that animation
                  Hero(
                    tag: project.name,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      // Responsiveness to determine the image size
                      child: Responsive(
                        mobile: Image.network(
                          project.image,
                          fit: BoxFit.cover,
                        ),
                        tablet: Image.network(
                          project.image,
                          fit: BoxFit.cover,
                        ),
                        desktop: SizedBox(
                          height: 350,
                          child: Image.network(
                            project.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Technologies",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Load the technologies for the project with the stateless widget
                  HorizontalTechView(
                    techList: project.technologiesUsed ?? [],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    project.description,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Stateless widget for the horizontal list of technologies
class HorizontalTechView extends StatelessWidget {
  final List<String> techList;
  const HorizontalTechView({required this.techList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: techList.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
            margin: const EdgeInsets.only(right: 15.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                color: Colors.white),
            child: Text(
              techList[index],
              style: const TextStyle(color: Colors.black),
            ),
          );
        },
      ),
    );
  }
}
