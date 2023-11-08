import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:ludo_app/app/game_module/view/screen/game_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    changeScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        decoration: const BoxDecoration(
            color: Color(0xff720201),
            image:
                DecorationImage(image: AssetImage('assets/images/lodo.png'))),
      ),
    );
  }

  Future<void> changeScreen(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 6),
    );

    Get.offAll(const MainScreen());

    setState(() {});
  }
}
