import 'package:flutter/material.dart';
import 'package:news_app/features/home/data/news_model/news_model.dart';
import 'package:news_app/features/home/presentation/views/widgets/article_details_view_body.dart';

class ArticleDetailsView extends StatelessWidget {
  const ArticleDetailsView({super.key});
  static String id = 'ArticleDetailsView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ArticleDetailsViewBody(newsModel: NewsModel(),),
    );
  }
}
