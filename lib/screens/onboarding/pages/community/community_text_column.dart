import 'package:flutter/material.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/text_column.dart';

class CommunityTextColumn extends StatelessWidget {
  const CommunityTextColumn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Community',
      text: 'Eu sint do id aliqua sint cillum commodo id voluptate qui',
    );
  }
}