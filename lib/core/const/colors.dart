
import 'dart:ui';

enum AppColor{
  royalWedding,
}

extension AppColorExtension on AppColor{
  Color getColor(){
    switch(this){
      case AppColor.royalWedding:
        return const Color(0xfffce4e2);
    }
  }
}