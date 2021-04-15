import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app_book_store/core/flutter_icons.dart';
//import 'package:app_book_store/src/pages/register_page.dart';
import 'package:app_book_store/pages/home_page.dart';
import 'package:app_book_store/widgets/app_outlinebutton.dart';
import 'package:app_book_store/widgets/app_textfield.dart';
import 'package:app_book_store/core/consts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TapGestureRecognizer registerOnTap;
  @override
  void initState() {
    registerOnTap = TapGestureRecognizer();
    registerOnTap
      ..onTap = () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => RegisterPage(),
        //   ),
        // );
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top:70,bottom:50),
              child: Image.asset(
                "assets/LOGO.png",
                height: 200,
              ),
            ),
            Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 12),
            AppTextField(
              hint: "Email ID",
              icon: FlutterIconsLogin.email,
            ),
            SizedBox(height: 12),
            AppTextField(
              hint: "Password",
              icon: FlutterIconsLogin.lock,
              helpContent: Text(
                "Forgot?",
                style: TextStyle(fontSize: 16, color: AppColors.lightColor),
              ),
              helpOnTap: () {},
            ),
            SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.brownColor,
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onPressed: () {
                Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => HomePage(),
                            ),
                          );
              },
            ),
            SizedBox(height: 24),
            Text(
              "Or, login with...",
              style: TextStyle(color: Colors.black38),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: AppOutlineButton(
                    asset: "assets/google.png",
                    onTap: () {},
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: AppOutlineButton(
                    asset: "assets/facebook.png",
                    onTap: () {},
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: AppOutlineButton(
                    asset: "assets/apple.png",
                    onTap: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text.rich(
              TextSpan(
                text: "New to HON? ",
                children: [
                  TextSpan(
                    text: "Register",
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: registerOnTap,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
