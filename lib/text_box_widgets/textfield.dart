import 'package:flutter/material.dart';

Padding myTextField(
    String tName, TextInputType tInput, TextEditingController userControl) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(
      2,
      0,
      2,
      15,
    ),
    child: TextField(
      keyboardType: tInput,
      controller: userControl,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 249, 253, 252),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade900),
          borderRadius: BorderRadius.circular(8.0),
        ),
        labelText: tName,
        // hintText: tHint,
        labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
        // prefixIcon: Icon(tIcon),
      ),
    ),
  );
}

//Color(0xff368983)

Padding myButton(String bName, double height, double width, Color fColor,
    bColor, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: bColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            bName,
            style: TextStyle(fontSize: 20.0, color: fColor),
          )),
    ),
  );
}

// ignore: non_constant_identifier_names
Padding myTextField_with_Icon(tHint, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        hintText: tHint,
        prefixIcon: Icon(
          icon,
          color: Colors.grey[600],
        ),
        fillColor: const Color(0xFFe7edeb),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Padding myPassword_textField_with_Icon(tHint, TextEditingController controller,
    bool isHidden, VoidCallback togglePasswordView) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: TextField(
      obscureText: isHidden,
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          hintText: tHint,
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.grey[600],
          ),
          suffixIcon: InkWell(
            onTap: togglePasswordView,
            child: Icon(
              isHidden ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[600],
            ),
          ),
          fillColor: const Color(0xFFe7edeb),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0))),
    ),
  );
}

Padding myRichText(String pText, cText) {
  return Padding(
    padding: const EdgeInsets.all(1),
    child: RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: pText),
          TextSpan(
            text: cText,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    ),
  );
}
