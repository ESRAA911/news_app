import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/bloc/news_bloc.dart';
import 'package:news/features/home/bloc/news_event.dart';
import 'package:news/features/home/bloc/news_state.dart';
import 'package:news/features/home/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(
          FetchNewsEvent(category),
        );

    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is NewsSuccess) {
          return NewsListView(
            articles: state.articles,
          );
        }

        if (state is NewsFailure) {
          return const SliverToBoxAdapter(
            child: Text('Oops, something went wrong'),
          );
        }

        return const SliverToBoxAdapter(
          child: SizedBox.shrink(),
        );
      },
    );
  }
}
