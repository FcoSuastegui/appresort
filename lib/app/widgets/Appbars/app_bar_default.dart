import 'package:appresort/app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class AppBarDefault extends PreferredSize {
  final double height;
  final Gradient gradient;
  final Widget title, leading;
  final bool centerTitle;
  final List<Widget> actions;

  AppBarDefault({
    this.leading,
    this.centerTitle = false,
    this.gradient = const LinearGradient(
      colors: [AppTheme.kPrimaryColor, AppTheme.kPrimaryColor],
    ),
    this.title,
    this.actions,
    this.height = 1.0,
  });

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height / 1.2);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      leading: leading,
      title: title,
      actions: actions,
      elevation: 0,
    );
  }
}
