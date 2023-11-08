import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ludo_app/app/game_module/controller/ludo_controller.dart';
import 'package:ludo_app/utils/constants.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

///Widget for the dice
class DiceWidget extends StatefulWidget {
  const DiceWidget({super.key});

  @override
  State<DiceWidget> createState() => _DiceWidgetState();
}

class _DiceWidgetState extends State<DiceWidget> {
  final LudoController value = Get.put(LudoController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LudoController>(
      // no need to initialize Controller ever again, just mention the type
      builder: (value) => RippleAnimation(
        color: value.gameState == LudoGameState.throwDice
            ? value.currentPlayer.color
            : Colors.white.withOpacity(0),
        ripplesCount: 3,
        minRadius: 30,
        repeat: true,
        child: CupertinoButton(
          onPressed: value.throwDice,
          padding: const EdgeInsets.only(),
          child: value.diceStarted
              ? Image.asset("assets/images/dice/draw.gif", fit: BoxFit.contain)
              : Image.asset("assets/images/dice/${value.diceResult}.png",
                  fit: BoxFit.contain),
        ),
      ),
    );
  }
}
