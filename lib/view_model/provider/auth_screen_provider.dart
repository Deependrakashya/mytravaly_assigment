import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mytravaly/data/repositories/remote/auth_repo.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreenProvider extends ChangeNotifier {
  bool isLoading = false;
  AuthRepo _authRepo = AuthRepo();
  Future<bool> signInWithGoogle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      isLoading = true;
      notifyListeners();
      final GoogleSignInAccount? res = await _authRepo.signwithGoogle();
      log("auth res $res");
      if (res != null && res.authentication.idToken!.isNotEmpty) {
        prefs.setBool("isLogin", true);

        return true;
      }
      return false;
    } catch (e) {
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
