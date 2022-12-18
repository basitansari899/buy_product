import 'package:get/get.dart';

import '../screens/home_screen.dart';
import '../utils/bindings/home_binding.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.homeRoutes;

  static final routes = [
    // < -------------------- Home Page ----------------->
    GetPage(
      name: Routes.homeRoutes,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
    // GetPage(
    //   name: Routes.checkoutRoutes,
    //   page: () => SelectModifier(),
    //   binding: HomeBindings(),
    // ),
  ];
}