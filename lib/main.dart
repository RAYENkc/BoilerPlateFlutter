import 'dart:convert';

import 'package:BolilerPlate/config/app_constant.dart';
import 'package:BolilerPlate/config/app_theme.dart';
import 'package:BolilerPlate/config/statics/statics.dart';
import 'package:BolilerPlate/config/urls/global_configuration.dart';
import 'package:BolilerPlate/core/helpers/keys_storage.dart';
import 'package:BolilerPlate/core/helpers/local_storage.dart';
import 'package:BolilerPlate/core/helpers/principal_functions.dart';
import 'package:BolilerPlate/core/models/user_model.dart';
import 'package:BolilerPlate/core/services/firebase_api.dart';
import 'package:BolilerPlate/routes/app_pages.dart';
import 'package:BolilerPlate/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  await FirebaseApi().initAwesomeNotification();
  setupEnvironnment(Environnement.dev);
  getRoute();
}

Future<void> getRoute() async {
  Get.lazyPut(() => LocalStorageController());
  LocalStorageController localStorageController = Get.find();
  String? data = await localStorageController.getFromStorage(AppConstants.USER);

  if (data != null) {
    Map<String, dynamic> j = jsonDecode(data);
    Statics.loggedUser = UserModel.fromJson(j);
    runApp(App(route: AppRoutes.home));
  } else {
    runApp(App(route: AppRoutes.login));
  }
}

class App extends StatelessWidget {
  String? route;
  App({super.key, this.route});
  static String name = 'BolilerPlate';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) => GetMaterialApp(
              title: App.name,
              navigatorKey: KeysStorage.mainNavigatorKey,
              debugShowCheckedModeBanner: false,
              theme: AppThemes.defaultAppTheme,
              //? Locales management
              locale: GlobalConfiguration.supportedLocales.first,
              fallbackLocale: GlobalConfiguration.supportedLocales.first,
              initialRoute: route,

              //? EasyLoading
              builder: (context, widget) {
                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: FlutterEasyLoading(
                    child: widget,
                  ),
                );
              },
              //? Routing
              defaultTransition: Transition.cupertino,
              getPages: AppPages.routes,
            ));
  }
}
