import 'package:flutter/material.dart';
import 'src/pages/last_news_page/last_news_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Новости'),
        ),
        body: const LastNewsPage(),
      ),
    );
  }
}
