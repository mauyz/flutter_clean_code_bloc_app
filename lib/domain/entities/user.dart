class User {
  final String id;
  final String email;
  final String name;
  final String? location;
  final String? profilepicture;

  const User({
    required this.id,
    required this.email,
    required this.name,
    this.location,
    this.profilepicture,
  });
}
