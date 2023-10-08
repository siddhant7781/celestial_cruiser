// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final int count;
  final int current;

  const Carousel({
    Key? key,
    required this.count,
    required this.current,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        count,
        (i) {
          final isActive = current == i;
          return Container(
            margin: const EdgeInsets.only(right: 5),
            height: 5,
            width: 15,
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
