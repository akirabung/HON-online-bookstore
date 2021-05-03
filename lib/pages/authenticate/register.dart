import 'package:app_book_store/core/consts.dart';
import 'package:app_book_store/core/flutter_icons.dart';
import 'package:app_book_store/core/loading.dart';
import 'package:app_book_store/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: AppColors.lightColor,
            appBar: AppBar(
              backgroundColor: Colors.brown,
              elevation: 0.0,
              title: Text('Sign up to HON'),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 30),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        fontSize: 32,
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _firstNameController,
                      validator: (val) =>
                          val.isEmpty ? 'Enter a first name' : null,
                      decoration: InputDecoration(
                        hintText: 'FIrst Name',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Icon(Icons.person),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _lastNameController,
                      validator: (val) =>
                          val.isEmpty ? 'Enter a last name' : null,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Icon(Icons.person),
                        ),
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
                          "Register",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
                                    _firstNameController.text,
                                    _lastNameController.text,
                                    email,
                                    password);
                            if (result == null) {
                              setState(() {
                                error = 'Email is not valid or already in used';
                                loading = false;
                              });
                              // Navigator.pop(context);
                            } else {
                              print(result.toString());
                              _firstNameController.clear();
                              _lastNameController.clear();
                              Navigator.pop(context);
                            }
                          }
                        }),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
