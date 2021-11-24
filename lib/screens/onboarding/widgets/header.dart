import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';
import 'package:onboarding_concept/widgets/logo.dart';



class Header extends StatelessWidget {
  final VoidCallback onSkip;
  const Header({Key? key, required this.onSkip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Logo(
          color: kWhite,
          size: 32.0,
        ),
        GestureDetector(
          onTap: onSkip,
          child: Text(
            'skip',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(color: kWhite),
          ),
        )
      ],
    );
  }
}
