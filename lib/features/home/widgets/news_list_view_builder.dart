import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/bloc/news_bloc.dart';
import 'package:news/features/home/bloc/news_state.dart';
import 'package:news/features/home/widgets/news_list_view.dart';
class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({
    super.key,
    required this.category,
    required this.searchQuery,
  });

  final String category;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is NewsSuccess) {
          final filteredArticles = searchQuery.isEmpty
              ? state.articles
              : state.articles.where((article) {
                  final query = searchQuery.toLowerCase();
                  return article.title.toLowerCase().contains(query) ||
                      (article.subTitle ?? '')
                          .toLowerCase()
                          .contains(query);
                }).toList();

          return NewsListView(
            articles: filteredArticles,
          );
        }

        if (state is NewsFailure) {
          return const SliverToBoxAdapter(
            child: Text('Oops, something went wrong'),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
