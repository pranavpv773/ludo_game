import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ludo_app/main_screen.dart';
import 'package:provider/provider.dart';

import 'ludo_provider.dart';

// main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   return runApp(const Root());
// }

// class Root extends StatelessWidget {
//   const Root({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<LudoProvider>(
//             create: (context) => LudoProvider()),
//       ],
//       child: const MaterialApp(
//         home: MainScreen(),
//       ),
//     );
//   }
// }

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
      title: 'E-win',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const MainScreen(),
    );
  }
}
