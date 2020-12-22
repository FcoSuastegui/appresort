import 'package:flutter/material.dart';
import 'package:appresort/app/widgets/Appbars/app_bar_default.dart';
import 'package:appresort/app/views/profile/components/profile_body.dart';

class ProfileView extends StatelessWidget {
  static final String routeName = '/profile';
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Mi perfil"),
      ),
      body: SingleChildScrollView(
        child: ProfileBody(),
      ),
    );
  }
}
