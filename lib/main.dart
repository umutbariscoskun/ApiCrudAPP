import 'package:api_crud_app/core/config/dependency_injection/injectable.dart';
import 'package:api_crud_app/features/crud_app/presentation/home/home_view.dart';
import 'package:flutter/material.dart';

void main() async {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Api Crud App',
        theme: ThemeData(
          brightness: Brightness.light,
          // fontFamily: 'Inter',
          // scaffoldBackgroundColor: kBackGroundColor,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeView());
  }
}
