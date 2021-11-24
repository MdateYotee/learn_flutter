import 'package:flutter/material.dart';
import 'package:onboarding_concept/constants.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(kPaddingM),
      elevation:  0.0,
      shape: const CircleBorder(),
      fillColor: kWhite,
      child: const Icon(
        Icons.arrow_forward,
        color: kBlack,
        size: 32.0,
      ),
      onPressed: onPressed,
    );
  }
}
