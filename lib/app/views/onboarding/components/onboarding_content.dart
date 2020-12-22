import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  final String title, subtitle, image;
  final bool isTop;

  OnBoardingContent({
    @required this.title,
    @required this.image,
    this.subtitle,
    this.isTop = true,
  })  : assert(title != null);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: isTop ? 30.0 : null,
          bottom: isTop ? null : 80.0,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
