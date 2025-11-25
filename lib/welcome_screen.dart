import 'package:flutter/material.dart';
import 'gen/assets.gen.dart';
import 'gen/colors.gen.dart';

final class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.allPrimaryColor,
        body: Center(
          child: Assets.images.logo.image(),
        ));
  }
}
