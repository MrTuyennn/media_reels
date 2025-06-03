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
  Offset setA = const Offset(0, 0);
  Offset setB = const Offset(0, 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final h = MediaQuery.of(context).size.width * 9 / 16;
      final w = MediaQuery.of(context).size.width;

      setState(() {
        setA = widget.a ?? Offset(10, h / 2);
        setB = widget.b ?? Offset(w - 10, h / 2);
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
                painter: ShapePainter(a: setA, b: setB),
              ),
              _buildDraggablePoint(setA, (delta) => setA += delta),
              _buildDraggablePoint(setB, (delta) => setB += delta),
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

class ShapePainter extends CustomPainter {
  final Offset a, b;

  ShapePainter({
    required this.a,
    required this.b,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    Offset startingPoint = a;
    Offset endingPoint = b;

    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  @override
  bool shouldRepaint(covariant ShapePainter oldDelegate) {
    return a != oldDelegate.a || b != oldDelegate.b;
  }
}
