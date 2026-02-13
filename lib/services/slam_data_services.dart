import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/friend.dart';

class SlamDataService {
  static Future<List<Friend>> loadFriends() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/friends.json',
    );

    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList.map((json) => Friend.fromJson(json)).toList();
  }
}
