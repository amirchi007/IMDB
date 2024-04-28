import 'package:flutter/material.dart';

Heading(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 22,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          color: Colors.grey, // Shadow color
          offset: Offset(2, 2), // Position of the shadow
          blurRadius: 3, // Spread radius of the shadow
        ),
      ],
    ),
  );
}

Input(String label, String hinttext) {
  return InputDecoration(
    label: Text(label),
    hintText: hinttext,
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1,
      ),
    ),
  );
}

TxtBtn(String? title) {
  return TextButton(
    onPressed: () {},
    child: Text(
      title!,
      style: const TextStyle(
        color: Colors.grey,
      ),
    ),
  );
}

ShadowBtn() {
  return BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );
}

StyleBtn(Color foregroundColor, Color backgroundColor) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    foregroundColor: foregroundColor,
    backgroundColor: backgroundColor,
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
    textStyle: const TextStyle(
      fontSize: 15,
    ),
  );
}

LineTxt(String title) {
  return Row(
    children: <Widget>[
      Image.asset('assets/images/line.png'),
      const SizedBox(width: 22),
      Text(title),
      const SizedBox(width: 10),
      Image.asset('assets/images/line.png'),
    ],
  );
}
