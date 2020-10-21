import 'package:appresort/app/src/views/onboarding/components/onboarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  static final String routeName = '/onboarding';
  const OnBoardingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingBody(),
    );
  }
}
