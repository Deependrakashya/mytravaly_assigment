import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  GoogleSignIn googleSignIn = GoogleSignIn.instance;
  Future<GoogleSignInAccount?> signwithGoogle() async {
    googleSignIn.initialize(
      clientId:
          "924056076738-1nhba07c0cn6t5j747gg5agnnioiblek.apps.googleusercontent.com",
      serverClientId:
          "924056076738-2u3cpce43r619srns0ph6f30prlpv8th.apps.googleusercontent.com",
    );
    try {
      final res = await googleSignIn.attemptLightweightAuthentication();
      log(" $res");
      print("res : $res");
      return res;
    } catch (e) {
      log("error : $e");
      throw e.toString();
    }
  }
}
