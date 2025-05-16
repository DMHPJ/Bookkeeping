import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bill/index.dart';
import 'package:flutter_application_1/pages/home/index.dart';
import 'package:flutter_application_1/pages/myPage/index.dart';
import 'package:flutter_application_1/pages/report/index.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({required this.menuScreenContext, super.key});
  final BuildContext menuScreenContext;

  @override
  State<StatefulWidget> createState() {
    return _MyTabBarState();
  }
}

class _MyTabBarState extends State<MyTabBar> {
  late PersistentTabController _controller;
  late bool _hideNavBar;
  final List<ScrollController> _scrollControllers = [
    ScrollController(),
  ];

  final NavBarStyle _navBarStyle = NavBarStyle.style1;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  @override
  void dispose() {
    for (final element in _scrollControllers) {
      element.dispose();
    }
    super.dispose();
  }

  List<Widget> _buildScreens() => [
    HomePage(),
    Bill(),
    Report(),
    MyPage(),
  ];


  List<PersistentBottomNavBarItem> _navBarsItems() => [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home_outlined),
      title: "主页",
      textStyle: TextStyle(fontSize: 36.r),
      activeColorPrimary: Color(0xff004097),
      inactiveColorPrimary: Color(0xff3b3c50),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.text_snippet_outlined),
      title: "账单",
      textStyle: TextStyle(fontSize: 36.r),
      activeColorPrimary: Color(0xff004097),
      inactiveColorPrimary: Color(0xff3b3c50),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.pie_chart_outline),
      title: "报表",
      textStyle: TextStyle(fontSize: 36.r),
      activeColorPrimary: Color(0xff004097),
      inactiveColorPrimary: Color(0xff3b3c50),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: "我的",
      textStyle: TextStyle(fontSize: 36.r),
      activeColorPrimary: Color(0xff004097),
      inactiveColorPrimary: Color(0xff3b3c50),
    ),
  ];

  @override
  Widget build(final BuildContext context) => Scaffold(
    // 侧边栏
    // drawer: const Drawer(
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[Text("This is the Drawer")],
    //     ),
    //   ),
    // ),

    body: PersistentTabView(
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
      padding: EdgeInsets.only(top: 8, bottom: 20.h),
      
      // 悬浮球
      // floatingActionButton: IconButton(
      //   icon: Container(
      //     padding: const EdgeInsets.all(12),
      //     decoration: const BoxDecoration(
      //       shape: BoxShape.circle,
      //       color: Colors.red,
      //     ),
      //     child: const Icon(Icons.add, color: Colors.white),
      //   ),
      //   onPressed: () {},
      // ),
      
      // 弹出层？
      // onWillPop: (final context) async {
      //   await showDialog(
      //     context: context ?? this.context,
      //     useSafeArea: true,
      //     builder:
      //         (final context) => Container(
      //           height: 50,
      //           width: 50,
      //           color: Colors.white,
      //           child: ElevatedButton(
      //             child: const Text("Close"),
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //           ),
      //         ),
      //   );
      //   return false;
      // },
      backgroundColor: Color(0xffFEFFFF),
      isVisible: !_hideNavBar,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
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
      navBarHeight: 150.h,
      navBarStyle: _navBarStyle, // Choose the nav bar style with this property
    ),
  );
}
