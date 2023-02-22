import 'package:get/get.dart';
import 'package:k24/app/modules/splash/introduction_animation/introduction_animation_screen.dart';

import '../modules/changepasswordmember/bindings/changepasswordmember_binding.dart';
import '../modules/changepasswordmember/views/changepasswordmember_view.dart';
import '../modules/createmember/bindings/createmember_binding.dart';
import '../modules/createmember/views/createmember_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
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
      transition: Transition.fadeIn,
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.INTRO,
      page: () => IntroductionAnimationScreen(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.VIEWMEMBER,
      page: () => ViewmemberView(),
      binding: ViewmemberBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.CREATEMEMBER,
      page: () => CreatememberView(),
      binding: CreatememberBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.CHANGEPASSWORDMEMBER,
      page: () => const ChangepasswordmemberView(),
      binding: ChangepasswordmemberBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      transition: Transition.fadeIn,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
