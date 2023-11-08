import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/state_manager.dart';
import 'package:ludo_app/constants.dart';
import 'package:ludo_app/ludo_provider.dart';
import 'package:provider/provider.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

///Widget for the pawn
class PawnWidget extends StatefulWidget {
  final int index;
  final LudoPlayerType type;
  final int step;
  final bool highlight;

  const PawnWidget(this.index, this.type,
      {Key? key, this.highlight = false, this.step = -1})
      : super(key: key);

  @override
  State<PawnWidget> createState() => _PawnWidgetState();
}

class _PawnWidgetState extends State<PawnWidget> {
  final LudoController value = Get.put(LudoController());
  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    switch (widget.type) {
      case LudoPlayerType.green:
        color = LudoColor.green;
        break;
      case LudoPlayerType.yellow:
        color = LudoColor.yellow;
        break;
      case LudoPlayerType.blue:
        color = LudoColor.blue;
        break;
      case LudoPlayerType.red:
        color = LudoColor.red;
        break;
    }
    return IgnorePointer(
      ignoring: !widget.highlight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (widget.highlight)
            RippleAnimation(
              color: color,
              minRadius: 20,
              repeat: true,
              ripplesCount: 3,
              child: const SizedBox.shrink(),
            ),
          GetBuilder<LudoController>(
            // no need to initialize Controller ever again, just mention the type
            builder: (value) => GestureDetector(
              onTap: () {
                if (widget.step == -1) {
                  value.move(widget.type, widget.index, (widget.step + 1) + 1);
                } else {
                  value.move(widget.type, widget.index,
                      (widget.step + 1) + value.diceResult);
                }
                value.move(widget.type, widget.index, widget.step);
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: color, width: 2)),
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
