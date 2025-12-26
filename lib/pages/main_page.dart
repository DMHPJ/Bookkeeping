import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bill/index.dart';
import 'package:flutter_application_1/pages/home/index.dart';
import 'package:flutter_application_1/pages/myPage/index.dart';
import 'package:flutter_application_1/pages/report/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PersistentTabController _controller;
  final List<ScrollController> _scrollControllers = [
    ScrollController(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    for (final element in _scrollControllers) {
      element.dispose();
    }
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens() => [
        const HomePage(),
        const Bill(),
        const Report(),
        const MyPage(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_outlined),
          title: "主页",
          textStyle: TextStyle(fontSize: 12.r),
          activeColorPrimary: const Color(0xFF2965FF),
          inactiveColorPrimary: const Color(0xFF999999),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.text_snippet_outlined),
          title: "账单",
          textStyle: TextStyle(fontSize: 12.r),
          activeColorPrimary: const Color(0xFF2965FF),
          inactiveColorPrimary: const Color(0xFF999999),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.pie_chart_outline),
          title: "报表",
          textStyle: TextStyle(fontSize: 12.r),
          activeColorPrimary: const Color(0xFF2965FF),
          inactiveColorPrimary: const Color(0xFF999999),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: "我的",
          textStyle: TextStyle(fontSize: 12.r),
          activeColorPrimary: const Color(0xFF2965FF),
          inactiveColorPrimary: const Color(0xFF999999),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,
      hideOnScrollSettings: HideOnScrollSettings(
        hideNavBarOnScroll: true,
        scrollControllers: _scrollControllers,
      ),
      padding: EdgeInsets.only(top: 6.h, bottom: 6.h),
      backgroundColor: Colors.white,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 300),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
        onNavBarHideAnimation: OnHideAnimationSettings(
          duration: Duration(milliseconds: 100),
          curve: Curves.bounceInOut,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: 56.h,
      navBarStyle: NavBarStyle.style1,
    );
  }
}
