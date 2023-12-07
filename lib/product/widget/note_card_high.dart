import 'package:exercise/product/extension/context/border_radius.dart';
import 'package:exercise/product/extension/context/general.dart';
import 'package:exercise/product/extension/context/padding.dart';
import 'package:exercise/product/extension/context/size.dart';
import 'package:flutter/material.dart';

import '../../feature/my_space/model/note_card_high_model.dart';


class NoteCardHigh extends StatelessWidget {
  const NoteCardHigh({
    super.key, required this.model,
  });
  final NoteCardHighModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.dynamicOnly(top: (10 - model.note) / 100),
      width: context.sized.dynamicHeigth(0.06),
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