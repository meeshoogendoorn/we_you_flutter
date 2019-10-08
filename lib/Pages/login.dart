import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'dart:ui';

import 'package:survey_app/utils/login_presenter.dart';

class LoginPage extends StatefulWidget {
  static final String path = "lib/src/pages/login/login3.dart";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginScreenContract {
  LoginScreenPresenter _presenter;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  _LoginPageState(){
    this._presenter = new LoginScreenPresenter(this);
  }

  String emailValidator(String value){
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is verplicht";
    } else if(!regExp.hasMatch(value)){
      return "Dit is geen email";
    }
    return null;
  }

  String passwordValidator(String value){
    if(value.length == 0){
      return "Wachtwoord kan niet leeg zijn";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Stack(
        children: <Widget>[
          Container(
            height: 650,
            child: RotatedBox(
              quarterTurns: 2,
              child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [Color(0xFF26223D), Color(0xFF9200FA)],
                    [Color(0xFF26223D), Color(0xFF4E0A7D)],
                  ],
                  durations: [19440, 10800],
                  heightPercentages: [0.20, 0.25],
                  blur: MaskFilter.blur(BlurStyle.solid, 10),
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight,
                ),
                waveAmplitude: 0,
                size: Size(
                  double.infinity,
                  double.infinity,
                ),
              ),
            ),
          ),
          ListView(
            children: <Widget>[
              Container(
                height: 400,
                child: new Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Home4Talent", textAlign: TextAlign.center, style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0
                    )),
                    Card(
                      margin: EdgeInsets.only(left: 30, right:30, top:30),
                      elevation: 11,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextFormField(
                        validator: emailValidator,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person, color: Colors.black26,),
                            suffixIcon: Icon(Icons.check_circle, color: Colors.black26,),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black26),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30, right:30, top:20),
                      elevation: 11,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextFormField(
                        validator: passwordValidator,
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock, color: Colors.black26,),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.black26,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        color: Color(0xFFEA4249),
                        onPressed: () async {
                          //TODO fix authentication with token
                          _validateInputs();
                        },
                        elevation: 11,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
                        child: Text("Login", style: TextStyle(
                            color: Colors.white70
                        )),
                      ),
                    ),
                    Text("Wachtwoord vergeten?", style: TextStyle(
                        color: Colors.white
                    ))
                  ],
                ),)
              ),
              SizedBox(height: 100,),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("Nog geen account?"),
                    SizedBox(height: 20.0,),
                    Text("Neem dan contact op met Home4Talent"),
                    SizedBox(height: 20.0,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: RaisedButton(
                            child: Text("Mail"),
                            textColor: Colors.white,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                            ),
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: RaisedButton(
                            child: Text("Telefoon"),
                            textColor: Colors.white,
                            color: Colors.indigo,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                            ),
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(width: 20.0,),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void onLoginError(String errorTxt) {
    print(errorTxt);
  }

  @override
  void onLoginSuccess(String token) async {
    print(token);
    Navigator.pushNamed(context, '/main-employee');
  }

  void _validateInputs() async {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      await _presenter.doLogin(emailController.text, passwordController.text);
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }
}