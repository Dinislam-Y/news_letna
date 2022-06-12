import 'package:dart_rss/domain/rss_item.dart';
import 'package:flutter/material.dart';

import '/src/widgets/last_news24_widget.dart';
import '/src/api/src/line_rss_api.dart';
import '/src/pages/base_news_page/base_news_page.dart';

class LastNews24Page extends BaseNewsPage {
  const LastNews24Page({
    Key? key,
    required LineRssAip newsProvider,
  }) : super(newsProvider: newsProvider);

  @override
  Widget buildListViewItem(RssItem item) {
    return LastNews24ItemWidget(item: item);
  }
}
