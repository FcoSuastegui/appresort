import 'package:appresort/app/widgets/Animation/fade_animation.dart';
import 'package:appresort/app/widgets/Informacion/informacion.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeAnimation(1, Informacion.terminos),
        FadeAnimation(1, Informacion.footer),
      ],
    );
  }
}
