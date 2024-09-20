import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/styles/styles.dart';
import 'package:news_app/core/utilities/app_router.dart';
import 'package:news_app/features/home/data/news_model/news_model.dart';

class HeadlineNewsTile extends StatelessWidget {
  const HeadlineNewsTile({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kArticleDetailsView, extra: newsModel);
      },
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                height: 140,
                width: 135,
                imageUrl: newsModel.urlToImage ??
                    'https://i.pinimg.com/236x/b2/a7/8b/b2a78b7520577fc3664213e22bffd2c3.jpg',
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 35,
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
              )),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: 200,
                  child: Text(
                    newsModel.title ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  newsModel.source!.name ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16.copyWith(color: Colors.grey),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
