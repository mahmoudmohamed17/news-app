import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utilities/app_router.dart';
import 'package:news_app/core/utilities/assets_data.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToLoginView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 96.5,
        backgroundColor: kPrimaryColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(170),
          child: const Image(width: 190, image: AssetImage(AssetsData.logo)),
        ),
      ),
    );
  }

  navigateToLoginView() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRouter.kLoginView);
    });
  }
}
