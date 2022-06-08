import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_letna/src/api/src/api_exception.dart';

abstract class LentaRssAip {
  static const _urlBase = 'https://lenta.ru/rss/';

  Future<List<RssItem>> getNews();
}

// class LentaLastNewsProvider extends LentaRssAip {
//   final _listNews = 'top7';
//
//   @override
//   Future<List<RssItem>> getNews() async {
//     await Future.delayed(const Duration(seconds: 3));
//     try {
//       final response =
//           await http.get(Uri.parse(LentaRssAip._urlBase + _listNews));
//       if (response.statusCode == 200) {
//         return RssFeed.parse(response.body).items;
//       }
//       return throw RssNewsException();
//     } catch (e) {
//
//     }
//   }
// }
