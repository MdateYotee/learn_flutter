import 'package:flutter/material.dart';
import 'package:onboarding_concept/screens/onboarding/widgets/text_column.dart';

class EducationTextColumn extends StatelessWidget {
  const EducationTextColumn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Keep learning',
      text: 'Ipsim magna enim cupidatat culpa elit cillum velit occaecat',
    );
  }
}