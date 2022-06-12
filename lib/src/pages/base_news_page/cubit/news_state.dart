part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<RssItem> news;

  NewsLoadedState(this.news);
}

//ошибка при запросе
class NewsError extends NewsState {
  final String errorMessage;

  NewsError(this.errorMessage);
}
