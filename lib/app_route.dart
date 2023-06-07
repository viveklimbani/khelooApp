import 'package:auto_route/annotations.dart';
import 'feature/dashboard/dashboard_screen.dart';
import 'feature/dashboard/tab_screen/tab_support.dart';
import 'feature/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page, Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true, path: routeSplash),
    AutoRoute(page: TabSupport, path: routeHomeScreen),
    AutoRoute(page: DashboardScreen, path: routeDashboard),
  ],
)
class $AppRouter {}

const routeSplash = "splash_screen";
const routeHomeScreen = "home_screen";
const routeDashboard = "dashboard_screen";
