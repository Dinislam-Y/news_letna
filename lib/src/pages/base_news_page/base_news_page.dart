// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dart_rss/dart_rss.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '/src/api/src/line_rss_api.dart';
import 'cubit/news_cubit.dart';

abstract class BaseNewsPage extends StatelessWidget {
  final LineRssAip _newsProvider;

  const BaseNewsPage({Key? key, required LineRssAip newsProvider})
      : _newsProvider = newsProvider,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsCubit(_newsProvider),
      child: BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
        if (state is NewsInitial) {
          context.read<NewsCubit>().loadNews();
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NewsError) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is NewsLoadedState) {
          return RefreshIndicator(
            onRefresh: () => context.read<NewsCubit>().loadNews(),
            child: listBuilder(context, state),
          );
        }
        return Container();
      }),
    );
  }

  Widget listBuilder(BuildContext context, NewsLoadedState state) {
    return ListView.builder(
        itemCount: state.news.length,
        itemBuilder: (BuildContext context, int index) {
          final item = state.news[index];
          return buildListViewItem(item);
        });
  }

  Widget buildListViewItem(RssItem item);
}
