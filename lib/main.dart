import "package:flutter/material.dart";

void main() {
  runApp(
      MyApp()); // runApp renders the widged we created (calls the build method in our widget). It's a feature from flutter package.
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text("Hello!"),
    );
  }
}
