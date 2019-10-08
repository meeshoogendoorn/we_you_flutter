
import 'package:flutter/material.dart';

class ThemeContainer extends ChangeNotifier {

  Color _primary = Color(0xFF26223D);
  Color _accent = Color(0xFF9200FA);

  get primary {
    return this._primary;
  }

  set primary(Color color) {
    this._primary = color;
    this.notifyListeners();
  }

  get accent {
    return this._accent;
  }

  set accent(Color color) {
    this._accent = color;
    this.notifyListeners();
  }
}