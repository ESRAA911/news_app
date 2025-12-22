import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/data/repos/news_repo.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService newsService;

  NewsBloc(this.newsService) : super(NewsInitial()) {
    on<FetchNewsEvent>((event, emit) async {
      emit(NewsLoading());
      try {
        final articles =
            await newsService.getTopHeadlines(category: event.category);
        emit(NewsSuccess(articles));
      } catch (e) {
        emit(const NewsFailure('Failed to load news'));
      }
    });
  }
}
