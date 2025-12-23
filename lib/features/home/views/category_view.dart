import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/contstants/api_colors.dart';
import 'package:news/features/home/bloc/news_bloc.dart';
import 'package:news/features/home/bloc/news_event.dart';
import 'package:news/features/home/widgets/news_list_view_builder.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(FetchNewsEvent(widget.category));
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 30.h,right: 16.w,left: 16.w,bottom: 15.h),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() => searchQuery = value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search news...',
                    prefixIcon: Icon(Icons.search),
                     label: Text('Search'),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kButtonsColor),
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kButtonsColor,
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(16)).w,
                      ),
                      floatingLabelStyle: const TextStyle(color: kButtonsColor),
                  ),
                ),
              ),
            ),

            NewsListViewBuilder(
              category: widget.category,
              searchQuery: searchQuery,
            ),
          ],
        ),
      ),
    );
  }
}
