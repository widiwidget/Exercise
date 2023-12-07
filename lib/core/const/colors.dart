
import 'package:flutter/material.dart';

enum AppColor {
  royalWedding,
  lakeSide,
  camellia,
  whiteheaven,
  snowflake,
}

extension AppColorExtension on AppColor {
  Color getColor() {
    switch (this) {
      case AppColor.royalWedding:
        return const Color(0xfffce4e2);
      case AppColor.lakeSide:
        return const Color(0xffd6f0ef);
      case AppColor.camellia:
        return const Color(0xfff46956);
      case AppColor.whiteheaven:
        return const Color(0xfffefefe);
      case AppColor.snowflake:
        return Colors.grey[200]!;
    }
  }
}

