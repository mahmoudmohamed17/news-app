import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/api_failure.dart';
import 'package:news_app/features/home/data/news_model/news_model.dart';

abstract class HomeRepo {
  Future<Either<ApiFailure, List<NewsModel>>> getHeadLines(
      {required String category});
}
