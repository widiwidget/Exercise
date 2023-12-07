part of "../home_view.dart";

class _PartOfHomeTopComponent extends StatelessWidget with _TopComponentUtility{
  const _PartOfHomeTopComponent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //complex widget
        _photoAndTexts(context),
        _customElevatedButton(context, Icons.qr_code_2_outlined),
        _customElevatedButton(context, Icons.notifications_none_outlined),
      ],
    );
  }
}

mixin _TopComponentUtility{
  double topComponentGeneralSize(BuildContext context) => context.sized.dynamicHeigth(0.06);

  CustomElevatedButton _customElevatedButton(
      BuildContext context, IconData icon) {
    return CustomElevatedButton(
        shape: RoundedRectangleBorder(
            borderRadius: context.border.smallBorderRadius),
        height: topComponentGeneralSize(context),
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: AppColor.whiteHeaven.getColor(),
        onPressed: () {},
        child: Icon(icon));
  }

  Container _photoAndTexts(BuildContext context) {
    const personalImage = "assets/images/animation_face.jpg";
    const nameText = 'Paul A. Hayden';
    const personalJob = 'Business Administration';
    return Container(
      height: topComponentGeneralSize(context),
      width: topComponentGeneralSize(context) * 6,
      decoration: BoxDecoration(
          color: AppColor.royalWedding.getColor(),
          borderRadius: context.border.smallBorderRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: context.border.smallBorderRadius,
                image: const DecorationImage(
                    image: AssetImage(personalImage),
                    fit: BoxFit.cover)),
            width: topComponentGeneralSize(context),
            height: topComponentGeneralSize(context),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(nameText), Text(personalJob)],
          ),
          CustomElevatedButton(
              width: topComponentGeneralSize(context),
              backgroundColor: AppColor.royalWedding.getColor(),
              shape: RoundedRectangleBorder(borderRadius: context.border.smallBorderRadius),
              elevation: const MaterialStatePropertyAll(0),
              onPressed: () {},
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(context.iconSize.small),
                    color: Colors.black,
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: context.iconSize.small,
                  ))),
        ],
      ),
    );
  }
}
