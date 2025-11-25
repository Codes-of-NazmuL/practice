// // lib/widgets/buttons/custom_button.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '/constants/text_font_style.dart';
// import '/gen/colors.gen.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton({
//     super.key,
//     required this.onPressed,
//     required this.title,
//     this.isLoading = false,
//     this.backgroundColor,
//     this.foregroundColor,
//     this.borderRadius,
//     this.height,
//     this.width,
//     this.textStyle,
//     this.padding,
//   });

//   final VoidCallback? onPressed;
//   final String title;
//   final bool isLoading;
//   final Color? backgroundColor;
//   final Color? foregroundColor;
//   final BorderRadiusGeometry? borderRadius;
//   final double? height;
//   final double? width;
//   final TextStyle? textStyle;
//   final EdgeInsetsGeometry? padding;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width ?? double.infinity,
//       height: height ?? 50.h,
//       child: ElevatedButton(
//         onPressed: isLoading ? null : onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: backgroundColor ?? AppColors.allPrimaryColor,
//           foregroundColor: foregroundColor ?? AppColors.secondaryColor,
//           disabledBackgroundColor:
//               (backgroundColor ?? AppColors.allPrimaryColor).withOpacity(0.5),
//           disabledForegroundColor:
//               (foregroundColor ?? AppColors.secondaryColor).withOpacity(0.5),
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: borderRadius ?? BorderRadius.circular(12.r),
//           ),
//           padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
//         ),
//         child: isLoading
//             ? SizedBox(
//                 width: 20.w,
//                 height: 20.h,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2.w,
//                   valueColor: AlwaysStoppedAnimation<Color>(
//                     foregroundColor ?? AppColors.secondaryColor,
//                   ),
//                 ),
//               )
//             : Text(
//                 title,
//                 style: textStyle ?? TextFontStyle.text36c3B7DE4w700ApercuPro,
//                 textAlign: TextAlign.center,
//               ),
//       ),
//     );
//   }
// }

// // Alternative function-style customButton (if you prefer function over class)
// Widget customButton({
//   required VoidCallback? onPressed,
//   required String title,
//   bool isLoading = false,
//   Color? backgroundColor,
//   Color? foregroundColor,
//   BorderRadiusGeometry? borderRadius,
//   double? height,
//   double? width,
//   TextStyle? textStyle,
//   EdgeInsetsGeometry? padding,
// }) {
//   return SizedBox(
//     width: width ?? double.infinity,
//     height: height ?? 50.h,
//     child: ElevatedButton(
//       onPressed: isLoading ? null : onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: backgroundColor ?? AppColors.allPrimaryColor,
//         foregroundColor: foregroundColor ?? AppColors.secondaryColor,
//         disabledBackgroundColor:
//             (backgroundColor ?? AppColors.allPrimaryColor).withOpacity(0.5),
//         disabledForegroundColor:
//             (foregroundColor ?? AppColors.secondaryColor).withOpacity(0.5),
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//           borderRadius: borderRadius ?? BorderRadius.circular(12.r),
//         ),
//         padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
//       ),
//       child: isLoading
//           ? SizedBox(
//               width: 20.w,
//               height: 20.h,
//               child: CircularProgressIndicator(
//                 strokeWidth: 2.w,
//                 valueColor: AlwaysStoppedAnimation<Color>(
//                   foregroundColor ?? AppColors.secondaryColor,
//                 ),
//               ),
//             )
//           : Text(
//               title,
//               style: textStyle ?? TextFontStyle.text20c919EABw400ApercuPro,
//               textAlign: TextAlign.center,
//             ),
//     ),
//   );
// }

import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/provider/button_shadow_provider.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final Color strokeColor;
  final Color shaDowColor;

  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.backgroundColor,
      required this.strokeColor,
      required this.shaDowColor});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;

  _pressed() {
    isPressed = true;
  }

  _released() async {
    Future.delayed(Duration(milliseconds: 100));
    isPressed = false;
  }

  @override
  Widget build(BuildContext context) {
    final boolProvider = Provider.of<ButtonShadowProvider>(context);
    return GestureDetector(
        onTapDown: (details) {
          setState(() {
            _pressed();
          });

          widget.onPressed();
        },
        onTapUp: (details) => setState(() {
              _released();
            }),
        onTapCancel: () => boolProvider.relased(),
        child: Container(
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              border: Border.all(color: widget.strokeColor, width: 1),
              borderRadius: BorderRadius.circular(30),
              boxShadow: isPressed == false
                  ? [
                      BoxShadow(
                          color: widget.shaDowColor,
                          spreadRadius: 3,
                          offset: Offset(0, 4))
                    ]
                  : []),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 82, vertical: 12),
            child: Center(
              child: Text(
                widget.text,
                style: TextFontStyle.text16cFFFFFFw700ApercuPro,
              ),
            ),
          ),
        ));
  }
}
