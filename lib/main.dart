import "package:flutter/material.dart";

void main() => runApp(
    MyApp()); // runApp renders the widged we created (calls the build method in our widget). It's a feature from flutter package.

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

//StatelessWidget can't have a state. It has data on it but it can only be changed externally
//StatefulWidget can have a State and the data can change extarnal and interal.
//Therefore we need two clases, one for the State(ful) and one for the rest.
//To let know the State belongs to MyApp widget we need to do two things:
//1. State<MyApp>
//2. State<StatefulWidget> createState()

class MyAppState extends State<MyApp> {
  // this variable we created it outside the build, otherwise would run everytime it builds the page
  var questionIndex = 0;
  void answerQuestion() {
    // we want that after the button is pressed, the new question appears
    questionIndex = questionIndex + 1;
    print(questionIndex);
  }

  @override //decorator from DART dependencies that makes code cleaner
  // every widget needs to extend Stateless/full widget
  Widget build(BuildContext context) {
    //runApp tell flutter to render something in the screen, therefore we need a build method
    var questions = [
      "What/'s your favourite color?",
      "What/'s your favourite city?",
      "What/'s your favourite club?",
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
            Text(
              questions[questionIndex],
            ),
            RaisedButton(
              child: Text("Answer 1"),
              onPressed:
                  answerQuestion, //onPressed takes a function, we call it without parentesis. Point the function instead of executing it. Think about tv example.
            ),
            RaisedButton(
              child: Text("Answer 2"),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text("Answer 3"),
              onPressed: answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
