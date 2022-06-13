// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dart_rss/dart_rss.dart';

// Project imports:
import '/src/widgets/image_news_widget.dart';

class LastNews24ItemWidget extends StatelessWidget {
  final RssItem item;

  const LastNews24ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            blurRadius: 4,
            spreadRadius: 2,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: ImageNewsWidget(
                urlImage: item.enclosure!.url!,
              ),
            ),
            Expanded(
              flex: 3,
              child: _TextNews(
                item: item,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextNews extends StatelessWidget {
  final RssItem item;

  const _TextNews({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          item.title!,
          maxLines: 3,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          item.description!,
          maxLines: 5,
          style: const TextStyle(
            fontSize: 10,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'автор: ',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: item.author ?? 'Неизвестный автор',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
