// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import 'feature/dashboard/dashboard_screen.dart' as _i3;
import 'feature/dashboard/tab_screen/tab_support.dart' as _i2;
import 'feature/splash_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    TabSupport.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.TabSupport(),
      );
    },
    DashboardScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardScreen(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash_screen',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          SplashScreen.name,
          path: 'splash_screen',
        ),
        _i4.RouteConfig(
          TabSupport.name,
          path: 'home_screen',
        ),
        _i4.RouteConfig(
          DashboardScreen.name,
          path: 'dashboard_screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i4.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: 'splash_screen',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.TabSupport]
class TabSupport extends _i4.PageRouteInfo<void> {
  const TabSupport()
      : super(
          TabSupport.name,
          path: 'home_screen',
        );

  static const String name = 'TabSupport';
}

/// generated route for
/// [_i3.DashboardScreen]
class DashboardScreen extends _i4.PageRouteInfo<void> {
  const DashboardScreen()
      : super(
          DashboardScreen.name,
          path: 'dashboard_screen',
        );

  static const String name = 'DashboardScreen';
}
