import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/styles/styles.dart';
import 'package:news_app/core/utilities/functions/launch_custom_url.dart';
import 'package:news_app/core/widgets/custom_app_bar.dart';
import 'package:news_app/features/home/data/news_model/news_model.dart';

class ArticleDetailsViewBody extends StatelessWidget {
  const ArticleDetailsViewBody({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    // retrieve data send by the go_router pachage
    var newsModel = GoRouterState.of(context).extra! as NewsModel;
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      children: [
        const SizedBox(
          height: 5,
        ),
        const SafeArea(child: CustomAppBar()),
        const SizedBox(
          height: 20,
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: newsModel.urlToImage ??
                  'https://i.pinimg.com/236x/b2/a7/8b/b2a78b7520577fc3664213e22bffd2c3.jpg',
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          newsModel.title ?? '',
          style: Styles.textStyle20,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Updated at:  ${newsModel.publishedAt!.substring(0, 10)}',
              style: Styles.textStyle16,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Description:',
          style: Styles.textStyle32.copyWith(color: Colors.red),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          newsModel.description ??
              '[No description available for this article]',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Text(
              'By',
              style: Styles.textStyle20.copyWith(
                color: Colors.red,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                newsModel.source!.name ?? '',
                style: Styles.textStyle20,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Want to read more? check',
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                launchCustomUrl(context, newsModel.url);
              },
              child: Text(
                'Link',
                style: Styles.textStyle18.copyWith(
                  color: const Color(0xff008DD4),
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  decorationThickness: 4,
                  decorationColor: const Color(0xff008DD4),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}
