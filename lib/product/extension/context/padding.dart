

import 'package:exercise/product/extension/context/size.dart';
import 'package:flutter/cupertino.dart';

class _ContextPaddingExtension{
  _ContextPaddingExtension(BuildContext context) : _context = context;
  final BuildContext _context;

  double get _valueSmall => _context.sized.smallValue; //5
  double get _valueNormal => _context.sized.normalValue; //10
  double get _valueMedium => _context.sized.mediumValue; //20

  EdgeInsets dynamicAll(double value) => EdgeInsets.all(_context.sized.height * value);

  EdgeInsets dynamicSymmetric({required double vertical, required double horizontal})
  => EdgeInsets.symmetric(vertical: _context.sized.height * vertical, horizontal: _context.sized.height * horizontal);

  EdgeInsets get kZeroPadding => EdgeInsets.zero;
  EdgeInsets get allMedium => EdgeInsets.all(_valueMedium);
  EdgeInsets get allNormal => EdgeInsets.all(_valueNormal);

  EdgeInsets get topOnlyNormal => EdgeInsets.only(top: _valueNormal);
  EdgeInsets get topOnlySmall => EdgeInsets.only(top: _valueSmall);
  EdgeInsets get topOnlyMedium => EdgeInsets.only(top: _valueMedium);

  EdgeInsets get rightOnlyNormal => EdgeInsets.only(right: _valueNormal);

  EdgeInsets get bottomOnlyNormal => EdgeInsets.only(bottom: _valueNormal);

  EdgeInsets get mediumSymmetricHorizontal => EdgeInsets.symmetric(horizontal: _valueMedium);

  EdgeInsets get normalSymmetricVertical => EdgeInsets.symmetric(vertical: _valueNormal);
}

extension ContextPaddingExtension on BuildContext{
  _ContextPaddingExtension get padding => _ContextPaddingExtension(this);
}