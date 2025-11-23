// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: const Color(0xFFF5F5F5),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text("Updated Shape",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 30),
//               SizedBox(
//                 width: 300,
//                 height: 300,
//                 child: CustomPaint(
//                   painter: RPSCustomPainter(),
//                   child: const Center(
//                     child: Icon(
//                       Icons.add,
//                       color: Colors.white,
//                       size: 100,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // 1. Define Paint (Using the blue color from your snippet)
//     Paint paint_fill_0 = Paint()
//       ..color = const Color.fromARGB(255, 15, 0, 255)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     // 2. Define the Path using your specific coordinates
//     Path path_0 = Path();
//     path_0.moveTo(20,0);
//     path_0.quadraticBezierTo(size.width * 0.3189625, size.height * 0.4156788,
//         size.width * 0.3040500, size.height * 0.4385516);
//     path_0.lineTo(size.width * 0.2910375, size.height * 0.5767745);
//     path_0.quadraticBezierTo(size.width * 0.2897000, size.height * 0.6345230,
//         size.width * 0.3047625, size.height * 0.6526954);
//     path_0.quadraticBezierTo(size.width * 0.3201625, size.height * 0.6698604,
//         size.width * 0.3499250, size.height * 0.6779813);
//     path_0.lineTo(size.width * 0.4176750, size.height * 0.6875082);
//     path_0.quadraticBezierTo(size.width * 0.4678000, size.height * 0.6973078,
//         size.width * 0.4847375, size.height * 0.6644045);
//     path_0.quadraticBezierTo(size.width * 0.4970500, size.height * 0.6369782,
//         size.width * 0.4950000, size.height * 0.5863014);
//     path_0.lineTo(size.width * 0.4950000, size.height * 0.4965729);
//     path_0.quadraticBezierTo(size.width * 0.4977500, size.height * 0.4416992,
//         size.width * 0.4758375, size.height * 0.4110833);
//     path_0.quadraticBezierTo(size.width * 0.4546250, size.height * 0.3852517,
//         size.width * 0.4002125, size.height * 0.3995000);
//     path_0.lineTo(size.width * 0.3423750, size.height * 0.4121745);
//     path_0.close();

//     // 3. AUTO-SCALING LOGIC
//     // This moves and stretches the small shape path to fill the 300x300 container
//     Rect bounds = path_0.getBounds();
//     if (bounds.width > 0 && bounds.height > 0) {
//       path_0 = path_0.shift(Offset(-bounds.left, -bounds.top));
//       double scaleX = size.width / bounds.width;
//       double scaleY = size.height / bounds.height;
//       Matrix4 matrix = Matrix4.diagonal3Values(scaleX, scaleY, 1.0);
//       path_0 = path_0.transform(matrix.storage);
//     }

//     // 4. Draw Shadow and Path
//     canvas.drawShadow(path_0, Colors.black.withOpacity(0.2), 4.0, true);
//     canvas.drawPath(path_0, paint_fill_0);

//     // Layer 1 Stroke (Transparent in your code, but preserved here)
//     Paint paint_stroke_0 = Paint()
//       ..color = const Color.fromARGB(0, 33, 150, 243)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width * 0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;

//     canvas.drawPath(path_0, paint_stroke_0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
