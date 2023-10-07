// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nasa_hackathon/src/models/highlight_entity.dart';
import 'package:nasa_hackathon/src/res/colors.dart';
import 'package:nasa_hackathon/src/res/styles.dart';

class HighlightableText extends StatelessWidget {
  final String formattedString;
  final TextAlign textAlign;
  final Color? highlightColor;
  final TextStyle? mainTextStyle;

  const HighlightableText({
    Key? key,
    required this.formattedString,
    this.textAlign = TextAlign.start,
    this.highlightColor,
    this.mainTextStyle,
  }) : super(key: key);

  List<HighlightEntity> parseString() {
    return formattedString.split("|").map((e) {
      var isHighlighted = e.startsWith('\$');
      return HighlightEntity(
        text: isHighlighted ? e.substring(1) : e,
        isHighlighted: isHighlighted,
      );
    }).toList();
  }

  List<InlineSpan> getSpans() {
    return parseString()
        .map((e) => TextSpan(
              text: e.text,
              style: Styles.small.copyWith(
                color: e.isHighlighted
                    ? highlightColor ?? AppColors.highlight
                    : null,
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        style: (mainTextStyle ?? Styles.small).copyWith(
          fontFamily: 'Montserrat',
        ),
        children: getSpans(),
      ),
    );
  }
}
