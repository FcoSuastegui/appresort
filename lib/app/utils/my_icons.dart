import 'package:flutter/material.dart';

class MyIcons {
  static final MyIcons _instancia = new MyIcons._internal();
  factory MyIcons() => _instancia;
  MyIcons._internal();

  static Icon name({
    String name = 'home',
    double size = 25.0,
    Color color = Colors.white,
  }) {
    Map<String, dynamic> names = {
      'home': Icon(Icons.home, color: color, size: size),
      'person_outline': Icon(Icons.person_outline, color: color, size: size),
      'announcement': Icon(Icons.announcement, color: color, size: size),
      'attach_money': Icon(Icons.attach_money, color: color, size: size),
      'assignment': Icon(Icons.assignment, color: color, size: size),
      'thumbs_up_down': Icon(Icons.thumbs_up_down, color: color, size: size),
      'library_books': Icon(Icons.library_books, color: color, size: size),
      'exit_to_app': Icon(Icons.exit_to_app, color: color, size: size),
      'cake': Icon(Icons.cake, color: color, size: size),
      'monetization_on': Icon(Icons.monetization_on, color: color, size: size),
      'settings': Icon(Icons.settings, color: color, size: size),
      'attach_file': Icon(Icons.attach_file, color: color, size: size),
    };
    return names[name] ?? Icon(Icons.home, color: color, size: size);
  }
}