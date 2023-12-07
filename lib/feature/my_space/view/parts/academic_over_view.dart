part of "../my_space_view.dart";

class AcademicOverView extends StatelessWidget
    with HomeUtility, _AcademicPartUtility {
  const AcademicOverView({Key? key, required this.noteCardHighModelList})
      : super(key: key);
  final List<NoteCardHighModel> noteCardHighModelList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.topOnlyMedium,
      child: Container(
        width: context.sized.width,
        height: context.sized.dynamicHeigth(0.4),
        decoration: BoxDecoration(
            boxShadow: _componentShadow,
            color: AppColor.whiteHeaven.getColor(),
            borderRadius: context.border.smallBorderRadius),
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
                        _academicOverViewText(context),
                        _gridStructure(context)
                      ],
                    ),
                    _circularPercentIndicator(context),
                  ],
                ),
              ),
            ),
            _noteCardHeightPlace(context,noteCardHighModelList),
          ],
        ),
      ),
    );
  }
}

mixin _AcademicPartUtility {
  Container _academicOverviewTextInform(
      BuildContext context, String text, int index) {
    var dynamicHeigth = context.sized.dynamicHeigth(0.12);
    return Container(
      decoration: BoxDecoration(
        border: _setBorderToAcademicOverviewTextInform(index),
      ),
      width: dynamicHeigth,
      height: dynamicHeigth * (5/9),
      child: Text(text, style: context.general.textTheme.titleMedium,),
    );
  }

  Border? _setBorderToAcademicOverviewTextInform(int index) {
    switch (index) {
      case 0:
        return Border(
            bottom: _borderSideToOverviewMethod,
            right: _borderSideToOverviewMethod);
      case 1:
        return Border(
            bottom: _borderSideToOverviewMethod,
            left: _borderSideToOverviewMethod);
      case 2:
        return Border(
            top: _borderSideToOverviewMethod,
            right: _borderSideToOverviewMethod);
      case 3:
        return Border(
            top: _borderSideToOverviewMethod,
            left: _borderSideToOverviewMethod);
    }
    return null;
  }

  BorderSide get _borderSideToOverviewMethod => const BorderSide(color: Colors.black12, width: 1);

  Expanded _noteCardHeightPlace(BuildContext context,List<NoteCardHighModel> noteCardHighModelList) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: context.padding.dynamicSymmetric(horizontal: 0.035, vertical: 0.005),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: noteCardHighModelList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: (index == noteCardHighModelList.length - 1)
                  ? context.padding.kZeroPadding
                  : context.padding.rightOnlyNormal,
              child: NoteCardHigh(
                model: noteCardHighModelList[index],
              ),
            );
          },
        ),
      ),
    );
  }

  CircularPercentIndicator _circularPercentIndicator(BuildContext context) {
    return CircularPercentIndicator(
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
    );
  }

  Padding _gridStructure(BuildContext context) {
    var semesterText = "SEMESTER:6.8";
    var bestGPAText = 'BEST GPA:6.8';
    var backLogsText = "BACKLOGS:1";
    var attendanceText = "ATTENDANCE:91.5%";
    return Padding(
      padding: context.padding.topOnlySmall,
      child: SizedBox(
          height: 100,
          width: 180,
          child: Row(
            children: [
              Column(
                children: [
                  _academicOverviewTextInform(
                      context, semesterText, 0),
                  _academicOverviewTextInform(
                      context, bestGPAText, 2),
                ],
              ),
              Column(
                children: [
                  _academicOverviewTextInform(
                      context, backLogsText, 1),
                  _academicOverviewTextInform(
                      context, attendanceText, 3)
                ],
              )
            ],
          )),
    );
  }

  Row _academicOverViewText(BuildContext context) {
    var academicOverviewText = 'Academic Overview';
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.padding.rightOnlySmall,
          child: Text(academicOverviewText,
              style: context.general.textTheme.titleMedium),
        ),
        Icon(
          Icons.arrow_forward_ios_outlined,
          size: context.iconSize.small,
        )
      ],
    );
  }
}
