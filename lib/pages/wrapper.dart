import 'package:app_book_store/models/user.dart';
import 'package:app_book_store/widgets/launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Launcher();
    }
  }
}
