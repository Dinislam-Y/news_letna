import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_letna/src/widgets/image_news_widget.dart';
import 'package:news_letna/src/widgets/list_item_widget.dart';

import '/src/pages/last_news_page/cubit/news_cubit.dart';
import '/src/utils/utils_for_internet_browser.dart';

class LastNewsPage extends StatelessWidget {
  const LastNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsCubit(),
      child: const _LastNewsPage(),
    );
  }
}

class _LastNewsPage extends StatelessWidget {
  const _LastNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
      if (state is NewsInitial) {
        context.read<NewsCubit>().loadNews();
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is NewsError) {
        return Center(
          child: Text(state.errorMessage),
        );
      }
      if (state is NewsLoadedState) {
        return RefreshIndicator(
          onRefresh: () => context.read<NewsCubit>().loadNews(),
          child: listBuilder(context, state),
        );
      }
      return Container();
    });
  }
}

Widget listBuilder(BuildContext context, NewsLoadedState state) {
  return ListView.builder(
    itemCount: state.news.length,
    itemBuilder: (BuildContext context, int index) {
      final item = state.news[index];
      return ListItemWidget(item: item);
    },
  );
}
