import 'package:flutter/material.dart';
import 'package:google_mao/StudentSelect.dart';
import 'package:google_mao/TeacherLogin.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Selection Page"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
                child: const Text("Teacher"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TeacherLogin()),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
                child: const Text("Student"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => studentselect()),
                  );
                },
              ),
            ],
          ),
        ),
      );
}
