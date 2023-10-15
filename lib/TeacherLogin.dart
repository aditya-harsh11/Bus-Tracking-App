import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_mao/SelectRouteForSharing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherLogin extends StatefulWidget {
  const TeacherLogin({super.key});

  @override
  _TeacherLoginState createState() => _TeacherLoginState();
}

class _TeacherLoginState extends State<TeacherLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');

    if (storedEmail != null && storedPassword != null) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: storedEmail,
          password: storedPassword,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => selectRouteForSharing()),
        );
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Future<void> login(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', emailController.text);
      prefs.setString('password', passwordController.text);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => selectRouteForSharing()),
      );
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
          child: const Text('Wrong Email or Password'),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ));
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 25.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 25.0),
            ElevatedButton(
              onPressed: () {
                login(context);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
