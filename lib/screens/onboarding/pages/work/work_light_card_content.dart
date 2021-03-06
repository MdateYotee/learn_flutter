import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/icon_container.dart';

class WorkLightCardContent extends StatelessWidget {
  const WorkLightCardContent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget> [
        IconContainer(icon: Icons.event_seat, padding: kPaddingS),
        IconContainer(icon: Icons.business_center, padding: kPaddingM),
        IconContainer(icon: Icons.assessment ,padding: kPaddingS),
      ],
    );
  }
}