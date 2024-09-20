import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/errors/api_failure.dart';
import 'package:news_app/core/utilities/api_service.dart';
import 'package:news_app/features/home/data/news_model/news_model.dart';
import 'package:news_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final apiservice = Apiservice();
  @override
  Future<Either<ApiFailure, List<NewsModel>>> getHeadLines(
      {required String category}) async {
    try {
      var articles = await apiservice.getHeadlineNews(category: category);
      List<NewsModel> news = [];
      for (var article in articles['articles']) {
        if (article['source']['name'] == '[Removed]') {
          continue;
        } else {
          news.add(NewsModel.fromJson(article));
        }
      }
      return right(news);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMsg: e.toString()));
    }
  }
}
