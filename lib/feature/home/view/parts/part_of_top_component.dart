part of "../home_view.dart";

class _PartOfHomeTopComponent extends StatelessWidget {
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

  CustomElevatedButton _customElevatedButton(
      BuildContext context, IconData icon) {
    return CustomElevatedButton(
        shape: RoundedRectangleBorder(
            borderRadius: context.border.smallBorderRadius),
        height: context.sized.dynamicHeigth(0.06),
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: AppColor.drWhite.getColor(),
        onPressed: () {},
        child: Icon(icon));
  }

  Container _photoAndTexts(BuildContext context) {
    return Container(
      height: context.sized.dynamicHeigth(0.06),
      width: context.sized.dynamicHeigth(0.36),
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
                    image: AssetImage("assets/images/animation_face.jpg"),
                    fit: BoxFit.cover)),
            width: context.sized.dynamicHeigth(0.06),
            height: context.sized.dynamicHeigth(0.06),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Paul A. Hayden'), Text('Business Administration')],
          ),
          CustomElevatedButton(
              width: context.sized.dynamicHeigth(0.06),
              backgroundColor: AppColor.royalWedding.getColor(),
              shape: RoundedRectangleBorder(
                  borderRadius: context.border.smallBorderRadius),
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
