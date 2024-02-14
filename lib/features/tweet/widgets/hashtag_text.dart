import 'package:flutter/material.dart';
import 'package:x_clone/theme/pallete.dart';

class HashtagText extends StatelessWidget {
  final String text;
  const HashtagText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textspans = [];
    //TODO: Fix the Bug in which the Hashtags aren't noticed in the UI and tweet controller in Texts containing new lines.
    text.split(' ').forEach((element) {
      if (element.startsWith('#')) {
        textspans.add(TextSpan(
          text: '$element ',
          style: const TextStyle(
            color: Pallete.blueColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ));
      } else if (element.startsWith('www.') || element.startsWith('https://')) {
        textspans.add(TextSpan(
          text: '$element ',
          style: const TextStyle(
            color: Pallete.blueColor,
            fontSize: 18,
            decoration: TextDecoration.underline,
          ),
        ));
      } else {
        textspans.add(TextSpan(
          text: '$element ',
          style: const TextStyle(
            fontSize: 18,
          ),
        ));
      }
    });
    return RichText(
      text: TextSpan(
        children: textspans,
      ),
    );
  }
}
