import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/features/role%20section/widgets/role_card.dart';
import 'package:template_flutter/gen/assets.gen.dart';
import 'package:template_flutter/gen/colors.gen.dart';
import 'package:template_flutter/helpers/all_routes.dart';
import 'package:template_flutter/helpers/navigation_service.dart';
import 'package:template_flutter/helpers/ui_helpers.dart';

class RoleSectionScreeen extends StatelessWidget {
  const RoleSectionScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UIHelper.verticalSpace(24),
                Text(
                  "I am a",
                  style: TextFontStyle.text32c000000w700ApercuPro,
                ),
                Text(
                  "Select one that applies to you",
                  style: TextFontStyle.text16c000000w400ApercuPro,
                ),
                UIHelper.verticalSpace(40),
                RoleCard(
                    onTap: () {
                      NavigationService.navigateTo(Routes.kidsSignupScreen);
                    },
                    image: Assets.images.childImage,
                    text: "Child",
                    backgroundColor: AppColors.c3BB1E4),
                UIHelper.verticalSpace(20),
                // CustomShapeWidget(
                //   height: 100,
                //   width: 100,
                //   strokeWidth: 5,
                //   strokeColor: AppColors.allPrimaryColor,
                // ),
                RoleCard(
                    onTap: () {},
                    image: Assets.images.parentImage,
                    text: "Parent",
                    backgroundColor: AppColors.cFFA600)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
