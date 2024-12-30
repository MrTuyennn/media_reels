import 'package:flutter/material.dart';
import 'dart:math';

import 'package:media_reels/core/log/log.dart';

class SpinV3Page extends StatefulWidget {
  const SpinV3Page({super.key});

  @override
  State<SpinV3Page> createState() => _SpinV3PageState();
}

class _SpinV3PageState extends State<SpinV3Page>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final List<int> values = [
    15,
    10,
    5,
    // 10,
    // 15,
  ];
  bool spinning = false;
  int selectedValue = 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeOut);

    controller.addStatusListener((status) {
      // if (status == AnimationStatus.completed) {
      //   setState(() {
      //     final double angle = animation.value % (2 * pi);
      //     final int reversedIndex = values.length -
      //         1 -
      //         ((angle / (2 * pi / values.length)).floor() % values.length);
      //     selectedValue = values[reversedIndex];
      //     spinning = false;
      //   });
      // }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void spinToValue(int targetValue) {
    final int targetIndex = values.indexOf(targetValue);
    Log.error(targetIndex);
    if (targetIndex == -1) {
      // Nếu giá trị không tồn tại trong danh sách, dừng lại
      print("Giá trị không tồn tại trong danh sách!");
      return;
    }

    setState(() {
      controller.reset();
      controller.forward();
      Log.error(pi);
      spinning = true;

      // Tính toán góc dừng (thêm số vòng quay đầy đủ)
      final double anglePerSegment = 2 * pi / values.length;
      final int reversedIndex = values.length - 1 - targetIndex;
      final double targetAngle = reversedIndex * anglePerSegment;
      const double fullRotations = 1; // Số vòng quay đầy đủ
      const double finalAngle = -(pi / 6) * 6 - (pi / 12);

      // Gán giá trị này cho AnimationController
      animation = Tween<double>(begin: 0, end: finalAngle).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut),
      );
    });
  }

  Widget _gameWheel() {
    Log.error(animation.value);
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.rotate(
              angle: animation.value,
              child: child,
            );
          },
          child: CustomPaint(
            size: const Size(300, 300),
            painter: WheelPainter(values: values),
          ),
        ),
        Container(
          width: 10,
          height: 100,
          color: Colors.red,
          transform: Matrix4.translationValues(0, -140, 0),
        ),
        Positioned(
          bottom: -20,
          child: Text(
            "Selected: $selectedValue",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spin Wheel Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _gameWheel(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: spinning
                ? null
                : () => spinToValue(15), // Ví dụ: dừng tại giá trị 20
            child: const Text('Spin to 20'),
          ),
        ],
      ),
    );
  }
}

class WheelPainter extends CustomPainter {
  final List<int> values;

  WheelPainter({required this.values});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;

    final double radius = size.width / 2;
    final double angle = 2 * pi / values.length;

    for (int i = 0; i < values.length; i++) {
      paint.color = i % 2 == 0 ? Colors.orange : Colors.blue;

      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        i * angle,
        angle,
        true,
        paint,
      );

      final double textAngle = (i * angle) + (angle / 2);
      final double x = radius + radius * 0.7 * cos(textAngle);
      final double y = radius + radius * 0.7 * sin(textAngle);

      final textPainter = TextPainter(
        text: TextSpan(
          text: values[i].toString(),
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      textPainter.paint(canvas,
          Offset(x - textPainter.width / 2, y - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
