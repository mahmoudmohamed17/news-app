import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/features/auth/data/repos/auth_repo.dart';
import 'package:news_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:news_app/features/home/data/repos/home_repo.dart';
import 'package:news_app/features/home/data/repos/home_repo_impl.dart';
import 'package:news_app/features/home/presentation/manager/news_cubit/news_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() async {
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl());
  getIt.registerSingleton<NewsCubit>(NewsCubit(getIt.get<HomeRepo>()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl());
  getIt.registerSingleton<Box>(Hive.box('emailIdBox'));
}
