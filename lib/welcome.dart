import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/text_box_widgets/textfield.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.blue[600],
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 70.0, 15.0, 0),
                child: Image.asset("assets/userblue.png"),
              ),
              const SizedBox(
                height: 80,
              ),
              myButton("خوش آمدید", 50, 150, Colors.white, Colors.blue, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
