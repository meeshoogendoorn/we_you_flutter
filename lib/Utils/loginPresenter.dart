import 'dart:io';
import 'package:survey_app/data/restDataSource.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(String token);
  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  RestDataSource api = new RestDataSource();

  LoginScreenContract _view;

  LoginScreenPresenter(this._view);

  doLogin(String username, String password) {
    api.login(username, password).then((String token) {
      _view.onLoginSuccess(token);
    }).catchError((Object error) {
      if(error is SocketException){
        return _view.onLoginError("Server niet bereikbaar! Meld dit bij nico@example.com");
      }
      _view.onLoginError(error.toString()
      );});
  }
}