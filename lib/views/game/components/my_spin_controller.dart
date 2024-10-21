import 'package:flutter/material.dart';
import 'package:media_reels/views/game/components/spin_view.dart';
import 'dart:math' as math;

class MySpinController {
  late AnimationController baseAnimation;
  late TickerProvider _tickerProvider;
  bool _xSpinning = false;
  List<SpinItem> _itemList = [];

  Future<void> initLoad({
    required TickerProvider tickerProvider,
    required List<SpinItem> itemList,
  }) async {
    _tickerProvider = tickerProvider;
    _itemList = itemList;
    await setAnimations(_tickerProvider);
  }

  Future<void> setAnimations(TickerProvider tickerProvider) async {
    baseAnimation = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(milliseconds: 200),
    );
  }

  Future<void> spinNow(
      {required int luckyIndex,
      int totalSpin = 10,
      int baseSpinDuration = 100}) async {
    //getWhereToStop
    int itemsLength = _itemList.length;
    int factor = luckyIndex % itemsLength;
    if (factor == 0) factor = itemsLength;
    double spinInterval = 1 / itemsLength;
    double target = 1 - ((spinInterval * factor) - (spinInterval / 2));

    if (!_xSpinning) {
      _xSpinning = true;
      int spinCount = 0;

      do {
        baseAnimation.reset();
        baseAnimation.duration = Duration(milliseconds: baseSpinDuration);
        if (spinCount == totalSpin) {
          await baseAnimation.animateTo(target);
        } else {
          await baseAnimation.forward();
        }
        baseSpinDuration = baseSpinDuration + 50;
        baseAnimation.duration = Duration(milliseconds: baseSpinDuration);
        spinCount++;
      } while (spinCount <= totalSpin);

      _xSpinning = false;
    }
  }
}

class SpinWheelPainter extends CustomPainter {
  final List<SpinItem> items;

  SpinWheelPainter({required this.items});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    final paint = Paint()..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.black
          .withOpacity(0.25) // Adjust the shadow color and opacity as needed
      ..maskFilter = const MaskFilter.blur(
          BlurStyle.normal, 10.0); // Adjust the blur radius as needed

    const spaceBetweenItems =
        0.05; // Adjust this value to set the desired space between items
    final totalSections = items.length;
    const totalAngle = 2 * math.pi;
    final sectionAngleWithSpace =
        (totalAngle - (totalSections * spaceBetweenItems)) / totalSections;
    const spaceOnBothSides = spaceBetweenItems / 2;

    for (var i = 0; i < items.length; i++) {
      final startAngle =
          i * (sectionAngleWithSpace + spaceBetweenItems) + spaceOnBothSides;

      paint.color = items[i].color;

      // Draw shadow before drawing the arc
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sectionAngleWithSpace,
        true,
        shadowPaint,
      );

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sectionAngleWithSpace,
        true,
        paint,
      );
    }

    // Draw a circle at the center of the wheel
    final centerCircleRadius =
        radius * 0.05; // Adjust the radius of the center circle as needed
    final centerCirclePaint = Paint()
      ..color = Colors.white; // Adjust the color of the center circle as needed
    canvas.drawCircle(center, centerCircleRadius, centerCirclePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
