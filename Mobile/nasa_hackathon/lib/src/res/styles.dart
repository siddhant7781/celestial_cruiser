import 'package:flutter/material.dart';

const normalStyle = TextStyle(
  fontSize: 14,
);

const titleStyle = TextStyle(
  fontSize: 35,
);

const boldStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

const errorStyle = TextStyle(
  fontSize: 14,
  color: Colors.red,
);

const smallHintStyle =
    TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.grey);

class Styles {
  static TextStyle header = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 28,
  );
  static TextStyle pin = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );

  static TextStyle normal = const TextStyle(
    fontWeight: FontWeight.w500,
  );

  static TextStyle small = Styles.normal.copyWith(
    fontSize: 12,
  );

  static TextStyle subheading = const TextStyle(
    fontSize: 16,
  );
}
