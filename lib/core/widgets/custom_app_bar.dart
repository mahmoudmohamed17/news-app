import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utilities/app_router.dart';
import 'package:news_app/core/widgets/app_logo.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.account_circle,
            color: kPrimaryColor,
            size: 32,
          ),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kProfileView);
          },
        ),
        const SizedBox(height: 70, width: 70, child: AppLogo()),
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: kPrimaryColor,
            size: 32,
          ),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kSearchView);
          },
        ),
      ],
    );
  }
}
