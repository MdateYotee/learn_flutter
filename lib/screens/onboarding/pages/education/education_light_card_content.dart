import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/icon_container.dart';

class EducationLightCardContent extends StatelessWidget {
  const EducationLightCardContent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        IconContainer(icon: Icons.brush, padding: kPaddingS),
        IconContainer(icon: Icons.camera_alt, padding: kPaddingM),
        IconContainer(icon: Icons.straighten, padding: kPaddingS),
      ],
    );
  }
}