import 'package:flutter/material.dart';

class AppOutlineButton extends StatelessWidget {
  final String asset;
  final VoidCallback onTap;

  AppOutlineButton({@required this.asset, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Image.asset(
          asset,
          height: 24,
        ),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        side: BorderSide(color: Colors.black12),
      ),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(16),
      //   ),
      // ),
      // borderSide: BorderSide(color: Colors.black12),
      onPressed: onTap,
    );
  }
}
