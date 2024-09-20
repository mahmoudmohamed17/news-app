import 'package:flutter/material.dart';
import 'package:news_app/core/utilities/assets_data.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(75),
      child: const Image(
          height: 150, width: 150, image: AssetImage(AssetsData.logo)),
    );
  }
}
