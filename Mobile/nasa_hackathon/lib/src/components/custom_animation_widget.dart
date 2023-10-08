// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAnimationWidget extends StatelessWidget {
  final double? end;
  final Widget child;
  const CustomAnimationWidget({
    Key? key,
    required this.child,
    this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final h = width * 0.8;
    final left = h * 0.2;
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: 20,
        end: end ?? -left,
      ),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      builder: (context, v, c) {
        return Positioned(
          left: v.toDouble(),
          top: 0,
          bottom: 0,
          child: c!,
        );
      },
      child: child,
    );
  }
}
