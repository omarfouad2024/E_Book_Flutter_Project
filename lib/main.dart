import 'package:e_book_flutter_project/Provider/articel_provider.dart';
import 'package:e_book_flutter_project/Provider/auth_provider.dart';
import 'package:e_book_flutter_project/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ArticleProvider()),
        ChangeNotifierProvider(create: (_) => Authprovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePageScreen(),
      ),
    );
  }
}
