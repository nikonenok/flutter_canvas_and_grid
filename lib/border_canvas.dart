import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
        ..color = Colors.white;
        canvas.drawPaint(paint);
        var center = Offset(size.width / 2, size.height / 2);
        drawFrame(canvas, center);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  var W = 600.0;
  void drawFrame(Canvas canvas, Offset offset) {
    var rect = Rect.fromCenter(center: offset, width: W, height: W);
    var border = Paint()
      ..color = Colors.black45
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;

    canvas.drawRect(rect, border);
  }

}
