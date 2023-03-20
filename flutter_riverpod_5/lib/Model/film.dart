class Film {
  final String id;
  final String title;
  final String description;
  final bool isFavourite;

  Film({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavourite,
  });

  Film copyWith({
    required bool isFavourite,
  }) {
    return Film(
      id: id,
      title: title,
      description: description,
      isFavourite: isFavourite,
    );
  }
}