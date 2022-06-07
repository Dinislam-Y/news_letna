import 'package:bloc/bloc.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'news24_state.dart';

var _urlLast24 = Uri.parse('https://lenta.ru/rss/last24');

class News24Cubit extends Cubit<News24State> {
  News24Cubit() : super(News24Initial());

  Future<void> loadNews() async {
    try {
      final response = await http.get(_urlLast24);
      final rssFeed = RssFeed.parse(response.body);
      emit(News24LoadedState(rssFeed.items));
    } catch (e) {
      emit(News24Error('Ошибка!!!'));
    }
  }

  Future<void> reloadNews() async {
    emit(News24Initial());
  }
}
