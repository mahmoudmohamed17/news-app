
import 'package:bloc/bloc.dart';
import 'package:news_app/features/home/data/news_model/news_model.dart';
import 'package:news_app/features/home/data/repos/home_repo.dart';
part 'news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit(this.homeRepo) : super(NewsInitial());
  HomeRepo homeRepo;
  Future<void> getHeadlineNews({required String category}) async {
    
    emit(NewsLoading());
    var result = await homeRepo.getHeadLines(category: category);
    result.fold((failure) {
      emit(NewsFailure(errorMsg: failure.errorMsg));
    }, (news) {
      emit(NewsSuccess(newsList: news));
    });
  }
}
