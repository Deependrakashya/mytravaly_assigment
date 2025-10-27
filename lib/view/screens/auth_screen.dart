import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mytravaly/view/screens/home_screen.dart';
import 'package:mytravaly/view_model/provider/auth_screen_provider.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthScreenProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Column(
                  children: [
                    Lottie.asset(
                      "assets/animations/Login.json",
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 20),
                    Text(
                      textAlign: TextAlign.center,
                      "Sign Up with Google \n to Explore App",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.all(20)),
                        minimumSize: WidgetStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.redAccent,
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                        shadowColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () async {
                        final res = await provider.signInWithGoogle();
                        if (res) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      },
                      child: Text("Sign Up With Google"),
                    ),
                  ),
                ),
              ],
            ),

            provider.isLoading
                ? Container(
                    height: MediaQuery.of(context).size.height * 1,
                    color: const Color.fromARGB(116, 0, 0, 0),
                    width: double.infinity,
                    child: Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(color: Colors.amber),
                      ),
                    ),
                  )
                : Container(height: 0),
          ],
        ),
      ),
    );
  }
}
