import 'package:flutter/material.dart';
import 'package:media_reels/views/game/components/my_spin_controller.dart';

class SpinItem {
  String label;
  TextStyle labelStyle;
  Color color;

  SpinItem(
      {required this.label, required this.color, required this.labelStyle});
}

class SpinView extends StatefulWidget {
  const SpinView({
    super.key,
    required this.mySpinController,
    required this.onFinished,
    required this.itemList,
    required this.wheelSize,
  });

  final MySpinController mySpinController;
  final List<SpinItem> itemList;
  final double wheelSize;
  final Function(void) onFinished;

  @override
  State<SpinView> createState() => _SpinViewState();
}

class _SpinViewState extends State<SpinView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.mySpinController.initLoad(
      tickerProvider: this,
      itemList: widget.itemList,
    );
  }

  @override
  void dispose() {
    super.dispose();
    null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          alignment: Alignment.center,
          child: AnimatedBuilder(
            animation: widget.mySpinController.baseAnimation,
            builder: (context, child) {
              double value = widget.mySpinController.baseAnimation.value;
              double rotationValue = (360 * value);
              return RotationTransition(
                turns: AlwaysStoppedAnimation(rotationValue / 360),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Container(
                          width: widget.wheelSize,
                          height: widget.wheelSize,
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black,
                                  Colors.white,
                                  Colors.black,
                                  Colors.white,
                                  Colors.black
                                ], // Define the colors for the gradient
                                begin: Alignment
                                    .topLeft, // Define the starting point of the gradient
                                end: Alignment
                                    .bottomRight, // Define the ending point of the gradient
                                // You can also define more stops and their positions if needed
                                // stops: [0.2, 0.7],
                                // tileMode: TileMode.clamp,
                              ),
                              //color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            padding: const EdgeInsets.all(5),
                            child: CustomPaint(
                              painter: SpinWheelPainter(items: widget.itemList),
                            ),
                          )),
                    ),
                    ...widget.itemList.map((each) {
                      int index = widget.itemList.indexOf(each);
                      double rotateInterval = 360 / widget.itemList.length;
                      double rotateAmount = (index + 0.5) * rotateInterval;
                      return RotationTransition(
                        turns: AlwaysStoppedAnimation(rotateAmount / 360),
                        child: Transform.translate(
                          offset: Offset(0, -widget.wheelSize / 4),
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Text(each.label, style: each.labelStyle),
                          ),
                        ),
                      );
                    }),
                    Container(
                      alignment: Alignment.center,
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                          color: Colors.transparent, shape: BoxShape.circle),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(0),
            child: const Icon(
              Icons.location_on_sharp,
              size: 50,
              color: Colors.green,
            )),
      ],
    );
  }
}
