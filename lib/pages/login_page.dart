import 'package:app_book_store/core/loading.dart';
import 'package:app_book_store/pages/authenticate/register.dart';
import 'package:app_book_store/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app_book_store/core/flutter_icons.dart';
import 'package:app_book_store/widgets/app_outlinebutton.dart';
import 'package:app_book_store/core/consts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: AppColors.lightColor,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 30),
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
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Icon(FlutterIconsLogin.email),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      obscureText: true,
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Icon(FlutterIconsLogin.lock),
                        ),
                      ),
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
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Incorrect email or password';
                              loading = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
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
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => Register(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
