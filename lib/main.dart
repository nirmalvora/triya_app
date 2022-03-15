import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/navigation/navigation_config.dart';
import 'package:triya_app/navigation/navigation_constant.dart';

void main() async {
  WidgetsBinding.instance;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
        designSize: Size(1080, 1920),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => GetMaterialApp(
              title: 'Base Project',
              builder: (context, child) {
                child = botToastBuilder(context, child);
                return child;
              },
              navigatorObservers: [
                BotToastNavigatorObserver(),
              ],
              theme: ThemeData(
                fontFamily: 'OpenSans-Regular',
              ),
              getPages: NavigationRoute.pages,
              initialRoute: NavigationName.splash,
              defaultTransition: Transition.noTransition,
              debugShowCheckedModeBanner: false,
            ));
  }
}
