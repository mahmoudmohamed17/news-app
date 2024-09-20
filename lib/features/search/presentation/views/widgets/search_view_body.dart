import 'package:flutter/material.dart';
import 'package:news_app/core/styles/styles.dart';
import 'category_item_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Search by category',
            style: Styles.textStyle20,
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Expanded(child: CategoryItemListView()),
      ],
    );
  }
}
