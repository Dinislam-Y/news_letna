import 'package:bloc/bloc.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'news_state.dart';

var _urlTop7 = Uri.parse('https://lenta.ru/rss/top7');

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> loadNews() async {
    try {
      final response = await http.get(_urlTop7);
      final rssFeed = RssFeed.parse(response.body);
      emit(NewsLoadedState(rssFeed.items));
    } catch (e) {
      emit(NewsError('Ошибка!!!'));
    }
  }

  Future<void> reloadNews() async {
    emit(NewsInitial());
  }
}
