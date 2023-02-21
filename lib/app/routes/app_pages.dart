import 'package:get/get.dart';

import '../modules/changepasswordmember/bindings/changepasswordmember_binding.dart';
import '../modules/changepasswordmember/views/changepasswordmember_view.dart';
import '../modules/createmember/bindings/createmember_binding.dart';
import '../modules/createmember/views/createmember_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/viewmember/bindings/viewmember_binding.dart';
import '../modules/viewmember/views/viewmember_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.VIEWMEMBER,
      page: () => const ViewmemberView(),
      binding: ViewmemberBinding(),
    ),
    GetPage(
      name: _Paths.CREATEMEMBER,
      page: () => const CreatememberView(),
      binding: CreatememberBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEPASSWORDMEMBER,
      page: () => const ChangepasswordmemberView(),
      binding: ChangepasswordmemberBinding(),
    ),
  ];
}
