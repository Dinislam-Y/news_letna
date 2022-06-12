import 'package:dart_rss/dart_rss.dart';
import 'package:http/http.dart' as http;

import '/src/api/src/api_exception.dart';

abstract class LineRssAip {
  static const _urlBase = 'https://lenta.ru/rss/';

  Future<List<RssItem>> getNews();
}

class LineLastNewsProvider extends LineRssAip {
  final _listNews = 'top7';

  @override
  Future<List<RssItem>> getNews() async {
    await Future.delayed(const Duration(seconds: 3));
    try {
      final response =
          await http.get(Uri.parse(LineRssAip._urlBase + _listNews));
      if (response.statusCode == 200) {
        return RssFeed.parse(response.body).items;
      }
      throw RssNewsException();
    } on RssNewsException {
      throw RssNewsException('ClientException');
    }
  }
}

class LineLast24NewsProvider extends LineRssAip {
  final _listNews24 = 'last24';

  @override
  Future<List<RssItem>> getNews() async {
    await Future.delayed(const Duration(seconds: 3));
    try {
      final response =
          await http.get(Uri.parse(LineRssAip._urlBase + _listNews24));
      if (response.statusCode == 200) {
        return RssFeed.parse(response.body).items;
      }
      throw RssNewsException();
    } catch (e) {
      throw RssNewsException('ClientException');
    }
  }
}
