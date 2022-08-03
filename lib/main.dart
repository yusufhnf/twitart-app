import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';
import 'src/infrastructure/navigation/routes.gr.dart';
import 'src/infrastructure/navigation/session_guard.dart';

void main() async {
  await configureApp();
  runApp(MyApp());
}

Future<void> configureApp() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter(sessionGuard: SessionGuard());
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          title: 'Twitart',
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.red,
              primaryColor: Colors.red),
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
        );
      },
    );
  }
}
