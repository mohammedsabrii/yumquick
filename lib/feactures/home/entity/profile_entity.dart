import 'package:hive/hive.dart';

part 'profile_entity.g.dart';

@HiveType(typeId: 2)
class ProfileEntity extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? profileImage;
  @HiveField(4)
  final String? cuntry;
  @HiveField(5)
  final String? address;
  @HiveField(6)
  final String? phomeNumber;
  @HiveField(7)
  final String? dateOfBirth;

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
