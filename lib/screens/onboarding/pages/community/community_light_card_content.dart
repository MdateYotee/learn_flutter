import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/icon_container.dart';

class CommunityLightCardContend extends StatelessWidget {
  const CommunityLightCardContend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        IconContainer(icon: Icons.person, padding: kPaddingS),
        IconContainer(icon: Icons.group, padding: kPaddingM),
        IconContainer(icon: Icons.insert_emoticon, padding: kPaddingS),
      ],
    );
  }
}
