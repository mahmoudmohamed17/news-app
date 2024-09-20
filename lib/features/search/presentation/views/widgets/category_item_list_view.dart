import 'package:flutter/material.dart';
import 'package:news_app/core/utilities/assets_data.dart';
import 'package:news_app/features/search/presentation/views/widgets/category_item.dart';
class CategoryItemListView extends StatelessWidget {
  const CategoryItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CategoryItem(
            text: 'General', label: 'general', image: AssetsData.general),
        CategoryItem(text: 'Sports', label: 'sports', image: AssetsData.sports),
        CategoryItem(text: 'Health', label: 'Health', image: AssetsData.health),
        CategoryItem(
            text: 'Technoloy', label: 'technoloy', image: AssetsData.technoloy),
        CategoryItem(
            text: 'Business', label: 'business', image: AssetsData.business),
        CategoryItem(
            text: 'Science', label: 'science', image: AssetsData.science),
        CategoryItem(
            text: 'Entertainment',
            label: 'entertainment',
            image: AssetsData.entertainment),
      ],
    );
  }
}
