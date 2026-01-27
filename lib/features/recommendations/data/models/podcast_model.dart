class PodcastModel {
  final String title;
  final String description;
  final String image;
  final String host; // optional

  PodcastModel({
    required this.title,
    required this.description,
    required this.image,
    this.host = '',
  });
}

// Dummy Data
List<PodcastModel> podcastsList = [
  PodcastModel(
    title: "Mental Health Tips",
    description: "Learn how to manage stress and anxiety.",
    image: "assets/podcast1.png",
    host: "Dr. Sarah",
  ),
  PodcastModel(
    title: "Mindfulness Daily",
    description: "Daily mindfulness exercises for beginners.",
    image: "assets/podcast2.png",
    host: "John Doe",
  ),
  PodcastModel(
    title: "Sleep Better",
    description: "Techniques to improve sleep quality.",
    image: "assets/podcast3.png",
    host: "Jane Smith",
  ),
];
