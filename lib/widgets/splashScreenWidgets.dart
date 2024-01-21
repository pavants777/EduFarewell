import 'package:flutter/material.dart';

Widget CompanyLog(double width, double height) {
  return Image.asset(
    'assets/logo1.png',
    width: width,
    height: height,
  );
}

Widget TextLine(String message, double size, context) {
  return Text(
    message,
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.secondary,
      letterSpacing: 7,
    ),
  );
}

Widget customTextField(TextEditingController _controller, String name,
    Icon icon, BuildContext context,
    {isTrue = false}) {
  return SizedBox(
    width: 300,
    child: TextField(
      controller: _controller,
      obscureText: isTrue,
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      decoration: InputDecoration(
        prefixIcon: icon,
        prefixIconColor: Theme.of(context).colorScheme.secondary,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
        contentPadding: const EdgeInsets.all(20),
        hintText: name,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary)),
      ),
    ),
  );
}

Widget customButton(VoidCallback onTap, String name, context) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      width: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(50)),
      child: Text(
        name,
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 15,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget UseSignIn(String text, text1, VoidCallback onTap, context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        text,
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
      GestureDetector(
        onTap: onTap,
        child: Text(
          text1,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary),
        ),
      )
    ],
  );
}

Widget styleWidget(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 1,
        width: 100,
        color: Theme.of(context).colorScheme.secondary,
      ),
      const SizedBox(width: 10),
      Text(
        'OR',
        style: TextStyle(
            fontSize: 16, color: Theme.of(context).colorScheme.secondary),
      ),
      const SizedBox(width: 10),
      Container(
        height: 1,
        width: 100,
        color: Theme.of(context).colorScheme.secondary,
      ),
    ],
  );
}

Widget bottomLogo() {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    GestureDetector(
      onTap: () {},
      child: Image.asset(
        'assets/01.webp',
        width: 40,
        height: 40,
      ),
    ),
    const SizedBox(
      width: 40,
    ),
    GestureDetector(
      onTap: () {},
      child: Image.asset(
        'assets/download.png',
        width: 40,
        height: 40,
      ),
    ),
  ]);
}
