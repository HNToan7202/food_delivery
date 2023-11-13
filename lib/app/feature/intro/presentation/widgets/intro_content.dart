import 'package:flutter/material.dart';

import '../../../../../common/color_extension.dart';
import '../../../../../common/text_theme.dart';

class IntroContent extends StatelessWidget {
  const IntroContent({
    super.key,
    required this.text,
    required this.image,
    required this.heading,
  });

  final String heading, text;
  final String image;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          image,
          width: media.width,
          height: media.height * 0.3,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          heading,
          style: tStyle.H4(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: tStyle.PrM(color: AppColorScheme.inkDarkGray),
          ),
        ),
      ],
    );
  }
}
