import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kheloo/feature/dashboard/tab_screen/tab_add.dart';
import 'package:kheloo/feature/dashboard/tab_screen/tab_live_casion.dart';
import 'package:kheloo/feature/dashboard/tab_screen/tab_register.dart';
import 'package:kheloo/feature/dashboard/tab_screen/tab_sports.dart';
import 'package:kheloo/feature/dashboard/tab_screen/tab_support.dart';

import '../../common/resources/colors.dart';
import '../../common/resources/dimen.dart';
import '../../common/resources/images.dart';
import '../../di/di_service.dart';
import '../session/session.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  ///singleton
  late Session _session;

  ///Tab file declaration
  late TabSupport tabSupport;
  late TabSports tabSports;
  late TabAdd tabAdd;
  late TabLiveCasino tabLiveCasino;
  late TabRegister tabRegister;

  ///Tabs
  late List<Widget> bottomTabs;
  late List<String> bottomNavItemNames;
  late List<String> bottomNavItemIcons;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _session = getIt.get<Session>();

    ///Init page controller
    _pageController = PageController(initialPage: _session.dashboardIndex);

    ///Init tab instances
    tabSupport = TabSupport();
    tabSports = TabSports();
    tabAdd = TabAdd();
    tabLiveCasino = TabLiveCasino();
    tabRegister = TabRegister();

    prepareTabs();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
        bottomNavigationBar: getCustomBottomNavigationBar,
        body: getDashboardBox,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: Spacing.jumbo30,
          width: Spacing.jumbo30,
          child: FloatingActionButton(
            onPressed: () {
              _pageController.jumpToPage(2);

              setState(() {
                _session.dashboardIndex = 2;
              });
            },
            backgroundColor: KAColors.primaryColor,
            foregroundColor: KAColors.textColor,
            elevation: 2.0,
            child: const Icon(
              Icons.add,
              size: Spacing.large,
            ),
          ),
        ),
      ),
    );
  }

  get getDashboardBox => PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: bottomTabs,
      );

  get getCustomBottomNavigationBar => SizedBox(
        height: Spacing.jumbo80,
        child: BottomNavigationBar(
          items: getBottomNavigationBarItems(),
          backgroundColor: KAColors.primaryColor,
          elevation: 5,
          selectedItemColor: KAColors.textColor,
          unselectedItemColor: KAColors.whiteColor,
          selectedIconTheme:
              const IconThemeData(color: KAColors.primaryGreenColor),
          enableFeedback: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => handleOnNavbarClick(index),
          currentIndex: _session.dashboardIndex,
        ),
      );

  List<BottomNavigationBarItem> getBottomNavigationBarItems() {
    List<BottomNavigationBarItem> listOfItems = [];

    for (int i = 0; i < bottomNavItemNames.length; i++) {
      listOfItems.add(BottomNavigationBarItem(
        icon: SvgPicture.asset(
          colorFilter: ColorFilter.mode(
              _session.dashboardIndex == i
                  ? KAColors.textColor
                  : KAColors.whiteColor,
              BlendMode.srcIn),
          bottomNavItemIcons[i],
          height: DimenConst.bottomNavbarIcon,
          // color: _session.dashboardIndex == i
          //     ? KAColors.textColor
          //     : KAColors.whiteColor,
        ),
        label: bottomNavItemNames[i],
      ));
    }

    return listOfItems;
  }

  void handleOnNavbarClick(int index) {
    _pageController.jumpToPage(index);

    setState(() {
      _session.dashboardIndex = index;
    });
  }

  void prepareTabs() {
    bottomTabs = [
      tabSupport,
      tabSports,
      tabAdd,
      tabLiveCasino,
      tabRegister,
    ];
    bottomNavItemNames = ['Support', 'Sports', '', 'Live Casino', 'Register'];
    bottomNavItemIcons = [
      Images.icSupport,
      Images.icSports,
      "",
      Images.icCasino,
      Images.icRegister,
    ];
  }
}
