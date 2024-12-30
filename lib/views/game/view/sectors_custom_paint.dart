import 'package:flutter/material.dart';

class SectorsCustomPaint extends StatefulWidget {
  const SectorsCustomPaint({super.key});

  @override
  State<SectorsCustomPaint> createState() => _SectorsCustomPaintState();
}

class _SectorsCustomPaintState extends State<SectorsCustomPaint> {
  String middleText = "Sector";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: CustomPaint(
          painter: SectorsPainter(
              context: context,
              middleText: middleText,
              onTap: (color) {
                setState(() {
                  middleText = color;
                });
              }),
          size: const Size(350, 350),
        ),
      ),
    );
  }
}

class SectorsPainter extends CustomPainter {
  final BuildContext context;
  final String middleText;
  final Function onTap;
  SectorsPainter(
      {required this.context, required this.middleText, required this.onTap});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;

    final double mainCircleDiameter = size.width;
    final arcsRect =
        Rect.fromLTWH(0, 0, mainCircleDiameter, mainCircleDiameter);
    const useCenter = true;

    List<Color> sectorColors = [
      Colors.black,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
      Colors.pink,
      Colors.amber,
      Colors.purple,
      Colors.pink,
      Colors.amber,
      Colors.black,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
      Colors.pink,
      Colors.amber,
      Colors.purple,
      Colors.pink,
      Colors.amber
    ];

    const double sweepAngle = 0.628319;
    double startAngle = 0.0;
    for (Color color in sectorColors) {
      canvas.drawArc(
          arcsRect, startAngle, sweepAngle, useCenter, paint..color = color);
      startAngle = startAngle + sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
