import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'helper/global.dart';
import 'modules/splash_screen.dart';
import 'services/pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter().then((value) async => await Pref.initializeHive());

  //enter full-screen
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  //for setting orientation to portrait only
  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    const borderRadius = BorderRadius.all(Radius.circular(26));
    //
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        color: pColor,

        //
        theme: ThemeData(
            fontFamily: 'Lato',
            useMaterial3: false,

            // set default theme for appbar
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),

            // set default theme for textField
            inputDecorationTheme: const InputDecorationTheme(
                isDense: true,
                filled: true,
                fillColor: sColor,

                // focus border style
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26),
                    borderRadius: borderRadius),

                // focus border style
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                    borderRadius: borderRadius))),

        //
        home: const SplashScreen());
  }
}
