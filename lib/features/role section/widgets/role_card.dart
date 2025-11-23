import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/constants/text_font_style.dart';
import 'package:template_flutter/gen/assets.gen.dart';

class RoleCard extends StatelessWidget {
  final VoidCallback onTap;
  final AssetGenImage image;
  final String text;
  final Color backgroundColor;
  const RoleCard(
      {super.key,
      required this.image,
      required this.text,
      required this.backgroundColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 299.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(33.r),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 0, left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextFontStyle.text36cFFFFFFw700ApercuPro,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 270.h,
                    width: 220.w,
                    child: image.image(fit: BoxFit.fitHeight),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
