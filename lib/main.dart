import "package:flutter/material.dart";

void main() => runApp(
    MyApp()); // runApp renders the widged we created (calls the build method in our widget). It's a feature from flutter package.

class MyApp extends StatelessWidget {
  @override //decorator from DART dependencies that makes code cleaner
  // every widget needs to extend Stateless/full widget
  Widget build(BuildContext context) {
    //runApp tell flutter to render something in the screen, therefore we need a build method
    var questions = [
      "What/'s your favourite color?",
      "What/'s your favourite city",
    ];
    return MaterialApp(
      home: Scaffold(
        // scaffold is a widget imported from material.dart that gives a base page design to the app (ctrl + space to check all the possible arguments)
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          // <Widget>[] tells dart that the list is going to be a list of widgets
          children: [
            Text("The question"),
            RaisedButton(
              child: Text("Answer 1"),
              onPressed: null,
            ),
            RaisedButton(
              child: Text("Answer 2"),
              onPressed: null,
            ),
            RaisedButton(
              child: Text("Answer 3"),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
