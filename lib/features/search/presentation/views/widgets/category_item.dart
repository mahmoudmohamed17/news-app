import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/styles/styles.dart';
import 'package:news_app/features/home/presentation/manager/news_cubit/news_cubit.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.text,
      required this.label,
      required this.image});
  final String text;
  final String label;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: GestureDetector(
        onTap: () async {
          BlocProvider.of<NewsCubit>(context).getHeadlineNews(category: label);
          GoRouter.of(context).pop();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
          ),
          height: 145,
          alignment: Alignment.center,
          child: Text(
            text,
            style: Styles.textStyle32
                .copyWith(fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
