import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/news_error_widget.dart';
import 'package:news_app/features/home/presentation/manager/news_cubit/news_cubit.dart';
import 'package:news_app/features/home/presentation/views/widgets/headline_news_tile.dart';

class HeadlineNewsTileListView extends StatelessWidget {
  const HeadlineNewsTileListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(builder: (context, state) {
      if (state is NewsSuccess) {
        return ListView.builder(
            itemCount: state.newsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: HeadlineNewsTile(
                  newsModel: state.newsList[index],
                ),
              );
            });
      } else if (state is NewsFailure) {
        return NewsErrorWidget(errorMsg: state.errorMsg);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
