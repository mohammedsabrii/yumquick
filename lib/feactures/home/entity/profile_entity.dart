class ProfileEntity {
  final String id;
  final String email;
  final String name;
  final String profileImage;
  final String cuntry;
  final String address;
  final String phomeNumber;
  final String dateOfBirth;

  ProfileEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.profileImage,
    required this.cuntry,
    required this.address,
    required this.phomeNumber,
    required this.dateOfBirth,
  });
  factory ProfileEntity.fromJson(Map<String, dynamic> json) {
    return ProfileEntity(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['username'] ?? '',
      profileImage: json['profile_picture'] ?? '',
      cuntry: json['country'] ?? '',
      address: json['address'] ?? '',
      phomeNumber: json['phone'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
    );
  }
}
