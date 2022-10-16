import 'package:equatable/equatable.dart';

class Author extends Equatable {
  const Author({
    required this.name,
    this.username,
    this.twitterUsername,
    this.githubUsername,
    this.profileImage,
    this.profileImage90,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['name'] as String,
      username: json['username'] as String?,
      twitterUsername: json['twitter_username'] as String?,
      githubUsername: json['github_username'] as String?,
      profileImage: json['profile_image'] as String?,
      profileImage90: json['profile_image_90'] as String?,
    );
  }

  final String name;
  final String? username;
  final String? twitterUsername;
  final String? githubUsername;
  final String? profileImage;
  final String? profileImage90;

  @override
  List<Object?> get props => [
        name,
        username,
        twitterUsername,
        githubUsername,
        profileImage,
        profileImage90,
      ];
}
