// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:nasa_hackathon/src/res/colors.dart';

class MainBtn extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final Color? color;

  const MainBtn({
    Key? key,
    required this.onTap,
    required this.title,
    this.color,
  }) : super(key: key);

  Widget getChild(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              backgroundColor: color ?? AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 15.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: getChild(context),
          ),
        ),
      ],
    );
  }
}
