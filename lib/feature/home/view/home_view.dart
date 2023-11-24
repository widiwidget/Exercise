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

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ProjectInit _projectInit;
  late final List<CardModel> cardModelList;
  late final List<NoteCardHighModel> noteCardHighModelList;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //top place
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //complex widget
                  Container(
                    height: context.sized.dynamicHeigth(0.06),
                    width: context.sized.dynamicHeigth(0.36),
                    decoration: BoxDecoration(
                      color: AppColor.royalWedding.getColor(),
                      borderRadius: context.border.smallBorderRadius
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: context.border.smallBorderRadius,
                            color: Colors.red
                          ),
                          width: context.sized.dynamicHeigth(0.06),
                          height: context.sized.dynamicHeigth(0.06),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Paul A. Hayden'),
                            Text('Business Administration')
                          ],
                        ),
                        CustomElevatedButton(
                          width: context.sized.dynamicHeigth(0.06),
                          backgroundColor: AppColor.royalWedding.getColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: context.border.smallBorderRadius
                          ),
                          elevation: const MaterialStatePropertyAll(0),
                            onPressed: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(context.iconSize.small),
                                color: Colors.black,
                              ),
                                child: Icon(
                                    Icons.keyboard_arrow_right_outlined,size: context.iconSize.small,))),
                      ],
                    ),

                  ),
                  CustomElevatedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: context.border.smallBorderRadius),
                    elevation: const MaterialStatePropertyAll(0),
                    onPressed: () {},
                    width: 40,
                    height: context.sized.dynamicHeigth(0.06),
                    backgroundColor: AppColor.drWhite.getColor(),
                    child: const Icon(Icons.qr_code_2_outlined),
                  ),
                  CustomElevatedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: context.border.smallBorderRadius),
                      height: context.sized.dynamicHeigth(0.06),
                      elevation: const MaterialStatePropertyAll(0),
                      backgroundColor: AppColor.drWhite.getColor(),
                      onPressed: () {},
                      child: const Icon(Icons.notifications_none_outlined)),
                ],
              ),
              //TodayTextPlace
              Padding(
                padding: context.padding.topOnlyMedium,
                child: Text('Today',style: context.general.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500),),
              ),
              Row(
                children: [
                  Padding(
                    padding: context.padding.rightOnlyNormal,
                    child: Text('Thursday . 29 Oct',style: context.general.textTheme.titleMedium,),
                  ),
                  const Icon(Icons.calendar_month_outlined)
                ],
              ),
              //card
              SizedBox(
                width: context.sized.width,
                height: context.sized.dynamicHeigth(0.2) + context.sized.normalValue,
                child: ListView.builder(
                  itemCount: cardModelList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: index == (cardModelList.length - 1) ? context.padding.kZeroPadding : context.padding.rightOnlyNormal,
                      child: HomeCardWidget(shadow: _componentShadow),
                    );
                  },
                ),
              ),
              //animation Slide
              SizedBox(
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
              ),
              //academic oveview
              Padding(
                padding: context.padding.topOnlyMedium,
                child: Container(
                  // padding: context.padding.dynamicAll(0.03),
                  width: context.sized.width,
                  height: context.sized.dynamicHeigth(0.4),
                  decoration: BoxDecoration(
                    boxShadow: _componentShadow,
                    color: AppColor.cascadingWhite.getColor(),
                    borderRadius: context.border.smallBorderRadius
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: context.padding.topOnlyNormal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: context.padding.rightOnlySmall,
                                        child: Text('Academic Overview', style: context.general.textTheme.titleMedium),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: context.iconSize.small,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: context.padding.topOnlySmall,
                                    child: SizedBox(
                                      height: 100,
                                      width: 180,
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              _academicOverviewTextInform(context, "SEMESTER:6.8",0),
                                              _academicOverviewTextInform(context, 'BEST GPA:6.8',2),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              _academicOverviewTextInform(context, "BACKLOGS:1",1),
                                              _academicOverviewTextInform(context, "ATTENDANCE:91.5%",3)
                                            ],
                                          )
                                        ],
                                      )
                                    ),
                                  )
                                ],
                              ),
                              CircularPercentIndicator(
                                backgroundColor: Colors.white,
                                radius: 50,
                                lineWidth: 5,
                                percent: 0.87,
                                center: Text(
                                  '%87',
                                  style: context.general.textTheme.headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                ),
                                progressColor: AppColor.turkishBoy.getColor(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(  ///burda içerdiği containerin padding degerine göre bi padding ver!!!
                        flex: 5,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: noteCardHighModelList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: (index == noteCardHighModelList.length - 1) ? context.padding.kZeroPadding :
                              context.padding.rightOnlyNormal,
                              child: NoteCardHigh(model: noteCardHighModelList[index],),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<BoxShadow> get _componentShadow => [const BoxShadow(
      color: Colors.black12,
      spreadRadius: 1,
      blurRadius: 1
  )];

  Container _academicOverviewTextInform(BuildContext context,String text,int index) {
    return Container(
      decoration: BoxDecoration(
        border: _setBorderToAcademicOverviewTextInform(index),
      ),
                                          width: 90,
                                          height: 50,
                                          child: Text(text,style:
                                          context.general.textTheme.titleMedium,),
                                        );
  }

  Border? _setBorderToAcademicOverviewTextInform(int index){
    switch(index){
      case 0:
        return Border(bottom: _borderSideToOverviewMethod,right: _borderSideToOverviewMethod);
      case 1:
        return  Border(bottom: _borderSideToOverviewMethod,left: _borderSideToOverviewMethod);
      case 2:
        return  Border(top: _borderSideToOverviewMethod,right: _borderSideToOverviewMethod);
      case 3:
        return  Border(top: _borderSideToOverviewMethod,left: _borderSideToOverviewMethod);
    }
    return null;
  }

  BorderSide get _borderSideToOverviewMethod => const BorderSide(color: Colors.black12,width: 1);
}



