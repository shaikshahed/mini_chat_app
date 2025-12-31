import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  late Box<UserModel> _userBox;

  UserProvider() {
    _userBox = Hive.box<UserModel>('users');
  }

  List<UserModel> get users => _userBox.values.toList();

  void addUser(String name) {
    _userBox.add(UserModel(name));
    notifyListeners();
  }
}
