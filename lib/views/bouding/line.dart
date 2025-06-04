import 'package:flutter/material.dart';

class Line extends StatefulWidget {
  const Line({
    super.key,
    this.a,
    this.b,
  });

  final Offset? a, b;

  @override
  State<Line> createState() => _LineState();
}

class _LineState extends State<Line> {
  /// End points of the line
  List<Offset> points = [Offset.zero, Offset.zero];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final h = MediaQuery.of(context).size.width * 9 / 16;
      final w = MediaQuery.of(context).size.width;

      setState(() {
        points = [
          widget.a ?? Offset(10, h / 2),
          widget.b ?? Offset(w - 10, h / 2),
        ];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.width * 9 / 16;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Line'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          height: h,
          width: w,
          child: Stack(
            children: [
              CustomPaint(
                painter: ShapePainter(points: points),
              ),
              ...List.generate(
                points.length,
                (i) => _buildDraggablePoint(i),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDraggablePoint(int index) {
    final offset = points[index];
    return Transform.translate(
      offset: offset - const Offset(15, 15),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanUpdate: (details) {
          final dx = offset.dx + details.delta.dx;
          final dy = offset.dy + details.delta.dy;

          final w = MediaQuery.of(context).size.width;
          final h = w * 9 / 16;

          final newOffset = Offset(
            dx.clamp(0.0, w),
            dy.clamp(0.0, h),
          );

          setState(() => points[index] = newOffset);
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  /// Points representing the line's start and end
  final List<Offset> points;

  ShapePainter({
    required this.points,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    if (points.length < 2) return;

    canvas.drawLine(points[0], points[1], paint);
  }

  @override
  bool shouldRepaint(covariant ShapePainter oldDelegate) {
    if (oldDelegate.points.length != points.length) return true;
    for (var i = 0; i < points.length; i++) {
      if (points[i] != oldDelegate.points[i]) return true;
    }
    return false;
  }
}
