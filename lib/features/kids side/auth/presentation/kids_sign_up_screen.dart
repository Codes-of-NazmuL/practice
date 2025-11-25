import 'package:flutter/material.dart';
import 'package:template_flutter/common_widgets/common_arrowback.dart';
import 'package:template_flutter/gen/colors.gen.dart';

class KidsSignUpScreen extends StatelessWidget {
  const KidsSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          leading: CommonArrowback(),
          backgroundColor: AppColors.secondaryColor,
        ),
        body: customSHpae());
  }
}
