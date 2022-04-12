import 'package:flutter/material.dart';
import '../../models/project.dart';
import '../../pages/project/project_detail.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({required this.project, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Set ontap to open the project detail page
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => ProjectDetail(project: project))),
      // Create project card with styling
      child: Container(
        width: 300,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                color: Colors.black.withOpacity(.15),
                blurRadius: 7,
              )
            ]),
        // Create a single Column
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Create a row for the title and the year date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  project.name,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15.0)),
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    project.year.toString(),
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
            // Spacing
            const SizedBox(
              height: 15,
            ),
            // Image for the project wrapped in Hero for smooth animation
            Hero(
              tag: project.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  project.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // More spacing
            const SizedBox(
              height: 10,
            ),
            // Text for the description
            Text(
              project.description,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
