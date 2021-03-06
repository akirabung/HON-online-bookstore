import 'package:app_book_store/models/user.dart';
import 'package:app_book_store/pages/wrapper.dart';
import 'package:app_book_store/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
          textTheme: GoogleFonts.reemKufiTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: Wrapper(),
      ),
    );
  }
}
