import 'package:exercise/product/extension/context/border_radius.dart';
import 'package:exercise/product/extension/context/general.dart';
import 'package:exercise/product/extension/context/icon_size.dart';
import 'package:exercise/product/extension/context/padding.dart';
import 'package:exercise/product/extension/context/size.dart';
import 'package:flutter/material.dart';

import '../../core/const/colors.dart';
import '../../core/widget/custom_elevated_button.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key, required this.shadow,
  });
  final List<BoxShadow> shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.topOnlyNormal,
      decoration: BoxDecoration(
        boxShadow: shadow,
          color: AppColor.cascadingWhite.getColor(),
          borderRadius: context.border.smallBorderRadius),
      height: context.sized.dynamicHeigth(0.2),
      width: context.sized.width - context.sized.dynamicHeigth(0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: context.padding.dynamicAll(0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Marketing principles and strategies',
                  style: context.general.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    const Icon(Icons.push_pin_outlined),
                    Text(
                      'Room 204 . UPCOMING',
                      style: context.general.textTheme.titleSmall,
                    ),
                  ],
                ),
                Container(
                  margin: context.padding.topOnlyNormal,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: context.border.smallBorderRadius,
                  ),
                  width: context.sized.dynamicWidth(0.45),
                  height: context.sized.dynamicHeigth(0.05),
                  child: Center(
                      child: Text(
                    '10:00 am - 11:00 am',
                    style: context.general.textTheme.titleMedium,
                  )),
                ),
              ],
            ),
          ), //pin_drop
          CustomElevatedButton(
              elevation: const MaterialStatePropertyAll(0),
              shape: RoundedRectangleBorder(
                  borderRadius: context.border.smallBorderRadius),
              backgroundColor: Colors.transparent,
              height: context.sized.height,
              width: context.sized.dynamicWidth(0.15),
              child: Icon(Icons.arrow_forward_ios_outlined,
                  size: context.iconSize.small),
              onPressed: () {})
        ],
      ),
    );
  }
}
