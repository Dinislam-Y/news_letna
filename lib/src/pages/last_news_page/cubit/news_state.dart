part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

//запрашиваем события
class NewsLoadedState extends NewsState {
  final List<Rss1Item> news;

  NewsLoadedState(this.news);
}

//ошибка при запросе
class NewsError extends NewsState {
  final String errorMessage;

  NewsError(this.errorMessage);
}
