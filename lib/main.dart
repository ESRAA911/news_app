import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/auth/views/login_view.dart';
import 'package:news/features/home/bloc/news_bloc.dart';
import 'package:news/features/home/data/repos/news_repo.dart';
import 'package:news/features/home/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final dio = Dio();
  runApp(MyApp(dio));
}

class MyApp extends StatefulWidget {
  final Dio dio;
  const MyApp(this.dio);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(480, 600),
      minTextAdapt: true,
      child: BlocProvider(
        create: (_) => NewsBloc(NewsService(widget.dio)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: FirebaseAuth.instance.currentUser == null
              ? LoginView()
              : HomeView(),
        ),
      ),
    );
  }
}
