import 'package:exercise/feature/home/model/note_card_high_model.dart';
import 'package:exercise/product/extension/context/border_radius.dart';
import 'package:exercise/product/extension/context/general.dart';
import 'package:exercise/product/extension/context/padding.dart';
import 'package:exercise/product/extension/context/size.dart';
import 'package:flutter/material.dart';

import '../../core/const/colors.dart';

class NoteCardHigh extends StatelessWidget {
  const NoteCardHigh({
    super.key, required this.model,
  });
  final NoteCardHighModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sized.dynamicHeigth(0.06),
      height: context.sized.dynamicHeigth(0.15), //model notuna göre high yüksekliğini belirle
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: context.border.largeBorderRadius,
      ),
      child: Padding(
        padding: context.padding.bottomOnlyNormal,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(model.note.toString(),style: context.general.textTheme.
          titleMedium),
        ),
      ),
    );
  }
}