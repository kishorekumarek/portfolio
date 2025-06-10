class Job {
  final String title;
  final String company;
  final String duration;
  final String description; // Could be a list of strings for bullet points

  Job({
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
  });
}
