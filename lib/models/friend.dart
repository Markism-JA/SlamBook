import 'package:flutter/material.dart';
import 'zodiac.dart';

class Friend {
  final String name;
  final String nickname;
  final String imageUrl;
  final DateTime birthday;
  final int age;
  final Zodiac zodiacSign;
  final Color favColor;
  final String food;
  final String foodImagePath;
  final String song;
  final String songImagePath;
  final String movie;
  final String movieImage;
  final String hobby;

  Friend({
    required this.name,
    required this.nickname,
    required this.imageUrl,
    required this.birthday,
    required this.age,
    required this.zodiacSign,
    required this.favColor,
    required this.food,
    required this.foodImagePath,
    required this.song,
    required this.songImagePath,
    required this.movie,
    required this.movieImage,
    required this.hobby,
  });

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      name: json['name'] ?? 'Unknown',
      nickname: json['nickname'] ?? 'No Nickname',
      imageUrl: json['imageUrl'] ?? '',
      birthday: json['birthday'] != null
          ? DateTime.parse(json['birthday'])
          : DateTime.now(),
      age: json['age'] ?? 0,
      zodiacSign: Zodiac.values.firstWhere(
        (e) => e.name == json['zodiacSign']?.toString().toLowerCase(),
        orElse: () => Zodiac.capricorn,
      ),
      favColor: json['favColor'] != null
          ? Color(int.parse(json['favColor'].toString()))
          : Colors.transparent,
      food: json['food'] ?? 'Anything!',
      foodImagePath: json['foodImagePath'] ?? '',
      song: json['song'] ?? 'None',
      songImagePath: json['songImagePath'] ?? '',
      movie: json['movie'] ?? 'None',
      movieImage: json['movieImage'] ?? '',
      hobby: json['hobby'] ?? 'N/A',
    );
  }
}
