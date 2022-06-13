// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:meta/meta.dart';

// Project imports:
import '/src/api/src/api_exception.dart';
import '/src/api/src/line_rss_api.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final LineRssAip _newsProvider;

  NewsCubit(this._newsProvider) : super(NewsInitial());

  Future<void> loadNews() async {
    try {
      emit(NewsLoadedState(await _newsProvider.getNews()));
    } on RssNewsException {
      emit(NewsError('Ошибка!!!'));
    }
  }

  Future<void> reloadNews() async {
    emit(NewsInitial());
  }
}
