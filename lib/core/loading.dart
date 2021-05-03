import 'package:app_book_store/core/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightColor,
      child: Center(
        child: SpinKitFoldingCube(
          color: Colors.brown,
          size: 50.0,
        ),
      ),
    );
  }
}
