import 'package:flutter/material.dart';

class Bouding extends StatefulWidget {
  final Offset? a, b, c, d, e, f;

  const Bouding({
    super.key,
    this.a,
    this.b,
    this.c,
    this.d,
    this.e,
    this.f,
  });

  @override
  State<Bouding> createState() => _BoudingState();
}

class _BoudingState extends State<Bouding> {
  /// List of hexagon corner points in order
  late List<Offset> points;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final h = MediaQuery.of(context).size.width * 9 / 16;
      final w = MediaQuery.of(context).size.width;

      setState(() {
        points = [
          widget.a ?? Offset(w / 2, h * 0.25),
          widget.b ?? Offset(w / 2 + 20, h * 0.25),
          widget.c ?? Offset(w / 2 + 40, h * 0.25 + 40),
          widget.d ?? Offset(w / 2 + 20, h * 0.25 + 60),
          widget.e ?? Offset(w / 2, h * 0.25 + 60),
          widget.f ?? Offset(w / 2 - 20, h * 0.25 + 40),
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
        title: const Text('Bounding Hexagon'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          height: h,
          width: w,
          child: Stack(
            children: [
              CustomPaint(
                painter: PolygonPainter(points: points),
              ),
              ...List.generate(
                points.length,
                (i) => _buildDraggablePoint(
                  points[i],
                  (delta) => points[i] += delta,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDraggablePoint(Offset offset, void Function(Offset) onUpdate) {
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

          setState(() => onUpdate(newOffset - offset));
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

class PolygonPainter extends CustomPainter {
  /// Points that make up the polygon in order
  final List<Offset> points;

  PolygonPainter({
    required this.points,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 6 || points.any((e) => e == Offset.zero)) return;

    final path = Path()
      ..moveTo(points[0].dx, points[0].dy)
      ..lineTo(points[1].dx, points[1].dy)
      ..lineTo(points[2].dx, points[2].dy)
      ..lineTo(points[3].dx, points[3].dy)
      ..lineTo(points[4].dx, points[4].dy)
      ..lineTo(points[5].dx, points[5].dy)
      ..close();

    final fillPaint = Paint()
      ..color = Colors.red.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(covariant PolygonPainter oldDelegate) {
    if (oldDelegate.points.length != points.length) return true;
    for (var i = 0; i < points.length; i++) {
      if (points[i] != oldDelegate.points[i]) return true;
    }
    return false;
  }
}
