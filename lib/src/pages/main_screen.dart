import 'package:flutter/material.dart';
import 'package:news_letna/src/api/src/line_rss_api.dart';

import '/src/pages/base_news_page/last_news24_page.dart';
import '/src/pages/base_news_page/last_news_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectIndex = 0;
  late Widget bodyWidget;

  @override
  void initState() {
    super.initState();
    onItemTapped(selectIndex);
  }

  void onItemTapped(int index) {
    setState(() {
      selectIndex = index;
      bodyWidget = buildCurrentWidget(index);
    });
  }

  Widget buildCurrentWidget(int type) {
    if (type == 0) {
      return LastNewsPage(newsProvider: LineLastNewsProvider());
    }
    if (type == 1) {
      return LastNews24Page(newsProvider: LineLast24NewsProvider());
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Новости'),
      ),
      body: buildCurrentWidget(selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTapped,
        currentIndex: selectIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.seven_mp),
            label: 'Топ 7 новостей',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.twenty_four_mp),
            label: 'За последние 24 часа',
          ),
        ],
      ),
    );
  }
}
