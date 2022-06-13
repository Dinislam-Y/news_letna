// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dart_rss/domain/rss_item.dart';

// Project imports:
import '/src/api/src/line_rss_api.dart';
import '/src/pages/base_news_page/base_news_page.dart';
import '/src/widgets/last_news_widget.dart';

class LastNewsPage extends BaseNewsPage {
  const LastNewsPage({
    Key? key,
    required LineRssAip newsProvider,
  }) : super(newsProvider: newsProvider);

  @override
  Widget buildListViewItem(RssItem item) {
    return LastNewsItemWidget(item: item);
  }
}
