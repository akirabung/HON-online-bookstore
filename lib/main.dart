import 'package:app_book_store/pages/home_page.dart';
import 'package:app_book_store/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        textTheme: GoogleFonts.reemKufiTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: LoginPage(),//HomePage(),
    );
  }
}
