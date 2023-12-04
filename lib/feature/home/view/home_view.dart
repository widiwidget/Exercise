import 'package:exercise/core/widget/custom_elevated_button.dart';
import 'package:exercise/product/extension/context/border_radius.dart';
import 'package:exercise/product/extension/context/duration.dart';
import 'package:exercise/product/extension/context/general.dart';
import 'package:exercise/product/extension/context/icon_size.dart';
import 'package:exercise/product/extension/context/padding.dart';
import 'package:exercise/product/extension/context/size.dart';
import 'package:exercise/product/init/card_model_init.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/const/colors.dart';
import '../../../product/widget/home_card_widget.dart';
import '../../../product/widget/note_card_high.dart';
import '../model/card_model.dart';
import '../model/note_card_high_model.dart';

part 'parts/part_of_top_component.dart';
part "parts/academic_over_view.dart";

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeUtility,_PageUtility{

  @override
  void initState() {
    super.initState();
    _projectInit = ProjectInit();
    cardModelList = _projectInit.cardModelList;
    noteCardHighModelList = _projectInit.noteCardHighModelList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.padding.dynamicOnly(top: 0.03,right: 0.03,left: 0.03),
        child: SafeArea(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _PartOfHomeTopComponent(),
              _todayText(context),
              _thursdayAndScheduleTextPlace(context),
              _cardListView(context,_componentShadow),
              _animationSlide(context),
              AcademicOverView(noteCardHighModelList: noteCardHighModelList),
              Padding(padding: context.padding.bottomOnlyNormal)
              
            ],
          ),
        ),
      ),
    );
  }
}

mixin _PageUtility{
  late final ProjectInit _projectInit;
  late final List<CardModel> cardModelList;
  late final List<NoteCardHighModel> noteCardHighModelList;

  Row _thursdayAndScheduleTextPlace(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: context.padding.rightOnlyNormal,
          child: Text('Thursday . 29 Oct',style: context.general.textTheme.titleMedium,),
        ),
        const Icon(Icons.calendar_month_outlined)
      ],
    );
  }
  Padding _todayText(BuildContext context) {
    return Padding(
      padding: context.padding.topOnlyMedium,
      child: Text('Today',style: context.general.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500),),
    );
  }
  SizedBox _animationSlide(BuildContext context) {
    return SizedBox(
      height: 5 + context.sized.mediumValue,
      child: ListView.builder(
        itemCount: cardModelList.length,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: context.padding.rightOnlySmall,
            child: AnimatedContainer(
              margin: context.padding.topOnlyMedium,
              duration: context.duration.durationNormal,
              width: cardModelList[index].isActive ? 40 : 20,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: context.border.largeBorderRadius,
              ),
            ),
          );
        },
      ),
    );
  }
  SizedBox _cardListView(BuildContext context,List<BoxShadow> componentShadow) {
    return SizedBox(
      width: context.sized.width,
      height: context.sized.dynamicHeigth(0.2) + context.sized.normalValue,
      child: ListView.builder(
        itemCount: cardModelList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: index == (cardModelList.length - 1) ? context.padding.kZeroPadding : context.padding.rightOnlyNormal,
            child: HomeCardWidget(shadow: componentShadow),
          );
        },
      ),
    );
  }
}

mixin HomeUtility{
  List<BoxShadow> get _componentShadow => [const BoxShadow(
      color: Colors.black12,
      spreadRadius: 1,
      blurRadius: 1
  )];
}