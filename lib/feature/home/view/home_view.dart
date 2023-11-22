import 'package:exercise/core/widget/custom_elevated_button.dart';
import 'package:exercise/product/extension/context/border_radius.dart';
import 'package:exercise/product/extension/context/size.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //top place
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: context.border.smallBorderRadius,
                    color: Colors.red
                  ),
                  width: context.sized.dynamicHeigth(0.04),
                  height: context.sized.dynamicHeigth(0.04),
                ),
                const Column(
                  children: [
                    Text('Paul A. Hayden'),
                    Text('Business Administration')
                  ],
                ),
                CustomElevatedButton(onPressed: (){}, child: const Icon(Icons.keyboard_arrow_right_outlined))
              ],
            )
          ],
        ),
      ),
    );
  }
}
