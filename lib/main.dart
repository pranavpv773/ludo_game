import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ludo_app/app/splash/view/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff202020)),
        scaffoldBackgroundColor: const Color(0xff202020),
      ),
      title: 'LUDO',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
