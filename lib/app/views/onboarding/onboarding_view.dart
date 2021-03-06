import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/views/onboarding/components/onboarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  static final String routeName = '/onboarding';
  const OnBoardingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Adapt.initContext(context);
    return Scaffold(
      body: OnBoardingBody(),
    );
  }
}
