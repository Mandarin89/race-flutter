import 'package:flutter/material.dart';

class ProfileDetaiLanguageslWidgetModel extends ChangeNotifier {
  bool _isEdit = false;
  bool get isEdit => _isEdit;

  Future<void> editChange() async {
    _isEdit = !_isEdit;
    notifyListeners();
  }
}