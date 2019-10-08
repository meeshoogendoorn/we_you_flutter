import 'package:survey_app/data/restDataSource.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(String token);
  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  RestDataSource api = new RestDataSource();
  LoginScreenPresenter(this._view);

  doLogin(String username, String password) {
    api.login(username, password).then((String token) {
      _view.onLoginSuccess(token);
    }).catchError((Object error) => _view.onLoginError(error.toString()));
  }
}