import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:exercise/core/const/colors.dart';
import 'package:exercise/feature/activity/activity_view.dart';
import 'package:exercise/feature/club/club_view.dart';
import 'package:exercise/product/extension/context/duration.dart';
import 'package:exercise/product/extension/context/size.dart';
import 'package:exercise/product/extension/tab_items.dart';
import 'package:flutter/material.dart';

import '../../my_space/view/my_space_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late final PageController pageController;
  int activeIndex = 2;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          MySpaceView(),
          ActivityView(),
          MySpaceView(),
          ClubView(),
          MySpaceView(),
        ],
      ),
      bottomNavigationBar: _convexBottomNavBar(context),
    );
  }

  ConvexAppBar _convexBottomNavBar(BuildContext context) {
    return ConvexAppBar(
      top: context.sized.kZero,
      color: Colors.black,
      backgroundColor: Colors.white,
      activeColor: Colors.transparent,
      initialActiveIndex: activeIndex,
      items: [
        _tabItem(Icons.flag_outlined,TabItems.campus.index,TabItems.campus.getName()),
        _tabItem(Icons.bolt_outlined,TabItems.activity.index,TabItems.activity.getName()),
        _tabItem(Icons.circle_outlined,TabItems.mySpace.index, TabItems.mySpace.getName()),
        _tabItem(Icons.groups_outlined,TabItems.clubs.index,TabItems.clubs.getName()),
        _tabItem(Icons.layers_outlined,TabItems.resource.index,TabItems.resource.getName()),
      ],
      onTap: _bottomNavBarOnTap,
    );
  }
  TabItem<dynamic> _tabItem(IconData icon,int index,String title) {
    return TabItem(
          icon: Icon(icon,color: activeIndex == index ? AppColor.hotCoral.getColor() : Colors.black),
          title: activeIndex == index ? '' : title,
        );
  }
  void _bottomNavBarOnTap(int index){
    setState(() {
      activeIndex = index;
      _changePage(index, context);
    });
  }
  void _changePage(int index,BuildContext context){
    pageController.animateToPage(index,
        duration: context.duration.durationFast,
        curve: Curves.fastLinearToSlowEaseIn);
  }
}
