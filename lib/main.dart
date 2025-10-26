import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mytravaly/firebase_options.dart';
import 'package:mytravaly/view/screens/auth_screen.dart';
import 'package:mytravaly/view/screens/home_screen.dart';
import 'package:mytravaly/view_model/provider/auth_screen_provider.dart';
import 'package:mytravaly/view_model/provider/home_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthScreenProvider>(
          create: (_) => AuthScreenProvider(),
        ),
        ChangeNotifierProvider<HomeScreenProvider>(
          create: (_) => HomeScreenProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Mytravaly Demo',
        debugShowCheckedModeBanner: false,
        home: prefs.getBool("isLogin") == null ? AuthScreen() : HomeScreen(),
      ),
    ),
  );
}
