import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template_flutter/gen/assets.gen.dart';
import 'package:template_flutter/gen/colors.gen.dart';

class CommonArrowback extends StatelessWidget {
  const CommonArrowback({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.allPrimaryColor,
            boxShadow: [BoxShadow(color: AppColors.c20457E)]),
        child: SvgPicture.asset(Assets.icons.arrowBack),
      ),
    );
  }
}
