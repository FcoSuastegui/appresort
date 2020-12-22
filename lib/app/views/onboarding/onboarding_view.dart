import 'package:appresort/app/themes/size_config.dart';
import 'package:appresort/app/views/onboarding/components/onboarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  static final String routeName = '/onboarding';
  const OnBoardingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: OnBoardingBody(),
    );
  }
}
