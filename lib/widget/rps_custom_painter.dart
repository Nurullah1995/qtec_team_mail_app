
import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter{
   final String text;
   RPSCustomPainter(this.text);
  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width*-0.0008333,size.height*0.0014286);
    path_0.lineTo(size.width*0.0008333,size.height*0.3557143);
    path_0.quadraticBezierTo(size.width*0.0060417,size.height*0.4996429,size.width*0.0833333,size.height*0.5000000);
    path_0.cubicTo(size.width*0.2916667,size.height*0.5000000,size.width*0.7083333,size.height*0.5000000,size.width*0.9166667,size.height*0.5000000);
    path_0.quadraticBezierTo(size.width*0.9893750,size.height*0.5039286,size.width*1.0008333,size.height*0.6414286);
    path_0.lineTo(size.width*0.9991667,size.height*0.0014286);

    canvas.drawPath(path_0, paint_fill_0);


    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_0, paint_stroke_0);



    // Text Layer 1

    canvas.save();
    final pivot_5550507990825 = Offset(size.width*0.65,size.height*0.11);
    canvas.translate(pivot_5550507990825.dx,pivot_5550507990825.dy);
    canvas.rotate(0);
    canvas.translate(-pivot_5550507990825.dx,-pivot_5550507990825.dy);
    TextPainter tp_5550507990825 = TextPainter(
      text:  TextSpan(text: """${text}""", style: TextStyle(
        fontSize: size.width*0.037,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        fontStyle: FontStyle.normal,
        decoration: TextDecoration.none,
      )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width*0.33, minWidth: size.width*0.33);
    tp_5550507990825.paint(canvas,pivot_5550507990825);
    canvas.restore();


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
