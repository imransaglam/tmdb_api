import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/pages/detailsscreen.dart';
import 'package:tmdb_api/pages/homescreen.dart';
import 'package:tmdb_api/pages/searchscreen.dart';
import 'package:tmdb_api/provider/tmdb_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TmdbProvider>(create: (_)=>TmdbProvider()),
  ],child:const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

