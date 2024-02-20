import 'package:BolilerPlate/features/authentification/screens/mobile/forget_mobile_screen.dart';
import 'package:BolilerPlate/features/authentification/screens/mobile/login_mobile_screen.dart';
import 'package:BolilerPlate/features/authentification/screens/mobile/register_mobile_screen.dart';
import 'package:BolilerPlate/features/authentification/screens/mobile/splash_page.dart';
import 'package:BolilerPlate/features/home/screens/mobile/home_mobile_screen.dart';
import 'package:BolilerPlate/routes/app_bindings.dart';
import 'package:BolilerPlate/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginPageBindings(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterMobile(),
      binding: RegisterPageBindings(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => const ForgetpasswordMobile(),
      //   binding: SettingPageBindings(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomePageBindings(),
    ),
  ];
}
