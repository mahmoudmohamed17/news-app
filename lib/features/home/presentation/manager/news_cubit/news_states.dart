part of 'news_cubit.dart';

abstract class NewsStates {}

class NewsInitial extends NewsStates {}

class NewsLoading extends NewsStates {}

class NewsSuccess extends NewsStates {
  final List<NewsModel> newsList;

  NewsSuccess({required this.newsList});
}

class NewsFailure extends NewsStates {
  final String errorMsg;

  NewsFailure({required this.errorMsg});
}
