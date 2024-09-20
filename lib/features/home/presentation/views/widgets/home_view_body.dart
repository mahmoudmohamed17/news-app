import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/styles/styles.dart';
import 'package:news_app/core/widgets/custom_app_bar.dart';
import 'package:news_app/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:news_app/features/home/presentation/views/widgets/headline_news_tile_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          const SafeArea(child: CustomAppBar()),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Hi, ${userInfoModel?.name}!',
            style: GoogleFonts.playfairDisplay(
                fontSize: 32, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Headlines',
            style: Styles.textStyle32,
          ),
          const SizedBox(
            height: 5,
          ),
          const Expanded(child: HeadlineNewsTileListView()),
        ],
      ),
    );
  }
}
