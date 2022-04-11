class Project {
  String name;
  int year;
  String image;
  String description;
  List<String>? technologiesUsed;

  Project({
    required this.name,
    required this.year,
    required this.image,
    required this.description,
    this.technologiesUsed,
  });
}
