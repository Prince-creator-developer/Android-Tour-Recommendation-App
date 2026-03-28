class Tour {
  final String id;
  final String title;
  final String description;
  final double price;
  final List<String> categories;
  final String imageUrl;
  final double rating;
  final int durationHours;
  final String location;
  final String locationId; // New: link to a specific Destination
  final String difficulty;
  final int maxGroupSize; // New
  final String language; // New
  bool isFavorite;

  Tour({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.categories,
    required this.imageUrl,
    required this.locationId,
    this.rating = 4.5,
    this.durationHours = 3,
    this.location = 'City Center',
    this.difficulty = 'Easy',
    this.maxGroupSize = 10,
    this.language = 'English',
    this.isFavorite = false,
  });

  Tour copyWith({bool? isFavorite}) {
    return Tour(
      id: id,
      title: title,
      description: description,
      price: price,
      categories: categories,
      imageUrl: imageUrl,
      locationId: locationId,
      rating: rating,
      durationHours: durationHours,
      location: location,
      difficulty: difficulty,
      maxGroupSize: maxGroupSize,
      language: language,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}