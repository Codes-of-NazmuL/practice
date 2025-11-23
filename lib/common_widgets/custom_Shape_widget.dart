import 'package:flutter/material.dart';

class CustomShapeWidget extends StatelessWidget {
  final double height;
  final double width;
  final double strokeWidth;
  final Color strokeColor;
  final String? image;
  const CustomShapeWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.strokeWidth,
      required this.strokeColor,
      this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CustomPaint(
        foregroundPainter: RPSBorderPainter(
            strokeColor: strokeColor, strokeWidth: strokeWidth),
        child: ClipPath(
          clipper: RPSClipper(),
          child: image == null
              ? const Icon(Icons.priority_high)
              : Image.network(image!),
        ),
      ),
    );
  }
}

class RPSBorderPainter extends CustomPainter {
  final Color strokeColor;
  final double strokeWidth;
  RPSBorderPainter({required this.strokeColor, required this.strokeWidth});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_stroke_0 = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = getRPSPath(size);

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return getRPSPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

Path getRPSPath(Size size) {
  Path path = Path();
  path.moveTo(size.width * 0.4975625, size.height * 0.0830000);
  path.quadraticBezierTo(size.width * 0.3460875, size.height * -0.0747056,
      size.width * 0.2328625, size.height * 0.1164203);
  path.quadraticBezierTo(size.width * 0.1405250, size.height * 0.3203513,
      size.width * 0.2374250, size.height * 0.5020615);
  path.quadraticBezierTo(size.width * 0.1388125, size.height * 0.7286692,
      size.width * 0.2452375, size.height * 0.9101416);
  path.quadraticBezierTo(size.width * 0.3853000, size.height * 1.0816038,
      size.width * 0.4975625, size.height * 0.9170001);
  path.quadraticBezierTo(size.width * 0.6701500, size.height * 1.0945080,
      size.width * 0.7750500, size.height * 0.8686537);
  path.quadraticBezierTo(size.width * 0.8519875, size.height * 0.6664869,
      size.width * 0.7603750, size.height * 0.5018633);
  path.quadraticBezierTo(size.width * 0.8639000, size.height * 0.2987054,
      size.width * 0.7673375, size.height * 0.1012166);
  path.quadraticBezierTo(size.width * 0.6469625, size.height * -0.0902462,
      size.width * 0.4975625, size.height * 0.0830000);
  path.close();
  Rect bounds = path.getBounds();
  if (bounds.width == 0 || bounds.height == 0) return path;
  path = path.shift(Offset(-bounds.left, -bounds.top));
  double scaleX = size.width / bounds.width;
  double scaleY = size.height / bounds.height;

  Matrix4 matrix = Matrix4.diagonal3Values(scaleX, scaleY, 1.0);
  path = path.transform(matrix.storage);

  return path;
}
