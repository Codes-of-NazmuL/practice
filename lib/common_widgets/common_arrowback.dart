import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template_flutter/gen/assets.gen.dart';
import 'package:template_flutter/gen/colors.gen.dart';

class CommonArrowback extends StatelessWidget {
  const CommonArrowback({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 36.h,
        width: 30.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.allPrimaryColor,
            boxShadow: [BoxShadow(color: AppColors.c20457E)]),
        child: SvgPicture.asset(Assets.icons.arrowBack),
      ),
    );
  }
}

class customSHpae extends StatelessWidget {
  const customSHpae({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RPS Custom Painter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const PainterScreen(),
    );
  }
}

class PainterScreen extends StatelessWidget {
  const PainterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        title: const Text('Clipped Image & Border'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Clipped Image with Border:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                color: Colors.transparent,
              ),
              child: CustomPaint(
                foregroundPainter: RPSBorderPainter(),
                child: ClipPath(
                  clipper: RPSClipper(),
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: Colors.grey.shade400);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Shared Path Logic ---
Path getRPSPath(Size size) {
  Path path = Path();
  path.moveTo(size.width * 0.82000, size.width * 0.58125);
  path.lineTo(size.width * 0.82996, size.width * 0.79134);
  path.quadraticBezierTo(size.width * 0.83375, size.width * 0.87125,
      size.width * 0.75412, size.width * 0.86359);
  path.lineTo(size.width * 0.26338, size.width * 0.81641);
  path.quadraticBezierTo(size.width * 0.18375, size.width * 0.80875,
      size.width * 0.18682, size.width * 0.72881);
  path.lineTo(size.width * 0.19568, size.width * 0.49869);
  path.quadraticBezierTo(size.width * 0.19875, size.width * 0.41875,
      size.width * 0.27704, size.width * 0.40232);
  path.lineTo(size.width * 0.72796, size.width * 0.30768);
  path.quadraticBezierTo(size.width * 0.80625, size.width * 0.29125,
      size.width * 0.81004, size.width * 0.37116);
  path.close();

  // 2. AUTO-SCALING LOGIC
  Rect bounds = path.getBounds();

  if (bounds.width == 0 || bounds.height == 0) return path;

  path = path.shift(Offset(-bounds.left, -bounds.top));

  double scaleX = size.width / bounds.width;
  double scaleY = size.height / bounds.height;

  Matrix4 matrix = Matrix4.diagonal3Values(scaleX, scaleY, 1.0);
  path = path.transform(matrix.storage);

  return path;
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

class RPSBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
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
