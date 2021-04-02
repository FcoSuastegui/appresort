import 'package:appresort/app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MyIcons {
  static final MyIcons _instancia = new MyIcons._internal();
  factory MyIcons() => _instancia;
  MyIcons._internal();

  static Icon name({
    String name = 'home',
    double size = 25.0,
    Color color = AppTheme.kPrimaryColor,
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
      'send': Icon(FontAwesome.send, color: color, size: size),
      'activities': Icon(Icons.work, color: color, size: size),
      'stats': Icon(Icons.leaderboard, color: color, size: size),
      'info': Icon(Icons.info, color: color, size: size),
      'gavel': Icon(Icons.gavel, color: color, size: size),
      'bookmark': Icon(FontAwesome.bookmark, color: color, size: size),
      'balance_scale': Icon(FontAwesome.balance_scale, color: color, size: size),
      'photo_album': Icon(Icons.photo_album, color: color, size: size),
      'headset_mic': Icon(Icons.headset_mic, color: color, size: size),
      'support_agent': Icon(Icons.support_agent, color: color, size: size),
      'menu_book': Icon(Icons.menu_book, color: color, size: size),
      'live_help': Icon(Icons.live_help, color: color, size: size),
      'payment': Icon(Icons.payment, color: color, size: size),
      'download_sharp': Icon(Icons.download_sharp, color: color, size: size),
      'work': Icon(Icons.work, color: color, size: size),
      'receipt': Icon(Icons.receipt, color: color, size: size),
      'receipt_long': Icon(Icons.receipt_long, color: color, size: size),
      'trending_up': Icon(Icons.trending_up, color: color, size: size),
      'trending_down': Icon(Icons.trending_down, color: color, size: size),
      'event': Icon(Icons.event, color: color, size: size),
    };
    return names[name] ?? Icon(Icons.home, color: color, size: size);
  }
}
