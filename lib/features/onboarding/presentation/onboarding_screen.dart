import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:template_flutter/common_widgets/custom_button.dart';
import 'package:template_flutter/common_widgets/custom_text_button.dart';
import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/gen/assets.gen.dart';
import 'package:template_flutter/gen/colors.gen.dart';
import 'package:template_flutter/helpers/navigation_service.dart';
import 'package:template_flutter/provider/button_shadow_provider.dart';

import '../../../helpers/all_routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final boolProvider = Provider.of<ButtonShadowProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.allPrimaryColor,
      body: Column(
        children: [
          Spacer(),
          Assets.images.logo.image(fit: BoxFit.fitHeight),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r))),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Save Smart, Learn Fast, Grow Together!",
                    style: TextFontStyle.text36c3B7DE4w700ApercuPro,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "The fun way for kids to learn money skills!",
                    style: TextFontStyle.text20c919EABw400ApercuPro,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomButton(
                    backgroundColor: AppColors.allPrimaryColor,
                    shaDowColor: AppColors.c20457E,
                    strokeColor: AppColors.c20457E,
                    onPressed: () {
                      boolProvider.pressed();
                    },
                    text: "I'm New Here!",
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomButton(
                      onPressed: () =>
                          NavigationService.navigateTo(Routes.onboardingScreen),
                      text: "I Already Have an Account",
                      backgroundColor: AppColors.allPrimaryColor,
                      strokeColor: AppColors.c20457E,
                      shaDowColor: AppColors.c20457E),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
