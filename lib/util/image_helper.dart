import 'package:flutter/material.dart';

class ImageHelper {
  static ImageProvider getProvider(String path) {
    if (path.isEmpty) {
      // Return a transparent pixel or a default placeholder
      return const AssetImage('assets/images/placeholder.png');
    }
    if (path.startsWith('http')) {
      return NetworkImage(path);
    }
    return AssetImage(path);
  }

  static Widget build(
    String path, {
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    if (path.isEmpty) {
      return SizedBox(height: height, width: width);
    }
    if (path.startsWith('http')) {
      return Image.network(
        path,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.broken_image, color: Colors.grey, size: height),
      );
    }
    return Image.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) =>
          Icon(Icons.broken_image, color: Colors.grey, size: height),
    );
  }
}
