import 'package:flutter/material.dart';
import 'package:flutter_application_1/text_box_widgets/textfield.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextEditingController name = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.blue,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: Stack(
            alignment: AlignmentDirectional.topCenter,
            fit: StackFit.loose,
            children: [
              Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // constraints: BoxConstraints(
                //     maxHeight: MediaQuery.of(context).size.height,
                //     maxWidth: MediaQuery.of(context).size.width),
                // decoration: const BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [
                //       Color.fromRGBO(21, 101, 192, 1),
                //       Color.fromRGBO(30, 136, 229, 1)
                //     ],
                //     begin: Alignment.topLeft,
                //     end: Alignment.centerRight,
                //   ),
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "تنظیمات",
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0),
                            child: Column(
                              children: [
                                const Stack(children: [
                                  CircleAvatar(
                                    radius: 45.0,
                                    backgroundImage:
                                        AssetImage('assets/userimage.png'),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 15.0,
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 20.0,
                                          color: Color(0xFF404040),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                                const SizedBox(
                                  height: 15,
                                ),
                                myTextField("نام", TextInputType.text, name),
                                myTextField(
                                    "تخلص", TextInputType.text, lastname),
                                myTextField(
                                    "ایمیل آدرس", TextInputType.text, email),
                                myTextField(
                                    "شماره تماس", TextInputType.text, phone),
                                myTextField(
                                    "رمز", TextInputType.text, password),
                                const SizedBox(
                                  height: 15,
                                ),
                                myButton("ذخیره", 50, 320, Colors.white,
                                    Colors.blue, () {}),
                                myButton("خروج", 50, 320, Colors.white,
                                    Colors.redAccent, () {}),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
