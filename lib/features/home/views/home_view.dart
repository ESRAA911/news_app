import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/contstants/api_colors.dart';
import 'package:news/features/auth/views/login_view.dart';
import 'package:news/features/home/bloc/news_bloc.dart';
import 'package:news/features/home/bloc/news_event.dart';
import 'package:news/features/home/widgets/categories_list_view.dart';
import 'package:news/features/home/widgets/news_list_view_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(FetchNewsEvent('general'));
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
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('News', style: TextStyle(color: Colors.black)),
              Text('Cloud', style: TextStyle(color: Colors.orange)),
            ],
            
          ),
          actions: [
            IconButton(
              onPressed: ()async{
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginView()));
              },
              icon: Icon(Icons.exit_to_app,color: kButtonsColor,))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16.h, top: 8.h),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() => searchQuery = value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search news...',
                      prefixIcon: const Icon(Icons.search),
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

              SliverToBoxAdapter(child: CategoriesListView()),
              SliverToBoxAdapter(child: SizedBox(height: 32.h)),

              NewsListViewBuilder(
                category: 'general',
                searchQuery: searchQuery,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
