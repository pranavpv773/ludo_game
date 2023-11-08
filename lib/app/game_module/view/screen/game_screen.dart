import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ludo_app/app/game_module/controller/ludo_controller.dart';
import 'package:ludo_app/app/game_module/view/widgets/board_widget.dart';
import 'package:ludo_app/app/game_module/view/widgets/dice_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final LudoController value = Get.put(LudoController());

  // @override
  // void initState() {
  //   ///Initialize images and precache it
  //   precacheImage(const AssetImage("assets/images/thankyou.gif"), context);
  //   precacheImage(const AssetImage("assets/images/board.png"), context);
  //   precacheImage(const AssetImage("assets/images/dice/1.png"), context);
  //   precacheImage(const AssetImage("assets/images/dice/2.png"), context);
  //   precacheImage(const AssetImage("assets/images/dice/3.png"), context);
  //   precacheImage(const AssetImage("assets/images/dice/4.png"), context);
  //   precacheImage(const AssetImage("assets/images/dice/5.png"), context);
  //   precacheImage(const AssetImage("assets/images/dice/6.png"), context);
  //   precacheImage(const AssetImage("assets/images/dice/draw.gif"), context);
  //   precacheImage(const AssetImage("assets/images/crown/1st.png"), context);
  //   precacheImage(const AssetImage("assets/images/crown/2nd.png"), context);
  //   precacheImage(const AssetImage("assets/images/crown/3rd.png"), context);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // alignment: Alignment.center,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoardWidget(),
                Center(
                    child: SizedBox(
                  width: 50,
                  height: 50,
                  child: DiceWidget(),
                )),
              ],
            ),
            GetBuilder<LudoController>(
              builder: (value) => value.winners.length == 3
                  ? Container(
                      color: Colors.black.withOpacity(0.8),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/thankyou.gif"),
                            const Text("Thank you for playing 😙",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.center),
                            Text(
                                "The Winners is: ${value.winners.map((e) => e.name.toUpperCase()).join(", ")}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 30),
                                textAlign: TextAlign.center),
                            const Divider(color: Colors.white),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                value.playAgain();
                              },
                              child: const Text("Play again",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                  textAlign: TextAlign.center),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
