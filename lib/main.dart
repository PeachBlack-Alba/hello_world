import "package:flutter/material.dart";
import "./quiz.dart";

void main() => runApp(
    MyApp()); // runApp renders the widged we created (calls the build method in our widget). It's a feature from flutter package.

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

//StatelessWidget can't have a state. It has data on it but it can only be changed externally and rerenders  when input data changes
//StatefulWidget can have a State and the data can change external and internal (internal state). Rerenders  when input data or local state changes
//Therefore we need two clases, one for the State(ful) and one for the rest.
//To let know the State belongs to MyApp widget we need to do two things:
//1. State<MyApp>
//2. State<StatefulWidget> createState()
//The _ before MyAppState makes the class private, so it can't be modified in other files

class MyAppState extends State<MyApp> {
  // this variable we created it outside the build, otherwise would run everytime it builds the page
  var questionIndex = 0;
  // we want that after the button is pressed, the new question appears so we change the index of the question+1
  //we need to tell flutter we are changing the state by answering and when it does, it should rerender the widget

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
    if (questionIndex < questions.length) {
      print("We have more questions!");
    } else {
      print("No more questions!");
    }
  }

  final questions = const [
    // const here because this list will not change
    {
      "questionText": "What is your fav color?",
      "answers": ["Black", "Red", "Blue"],
    },
    {
      "questionText": "What is your fav film?",
      "answers": ["La pantera Rosa", "Spired away", "True romance"],
    },
    {
      "questionText": "What is your fav food?",
      "answers": ["italian", "turkish", "Spanish"],
    },
  ];

  @override
  //decorator from DART dependencies that makes code cleaner
  // every widget needs to extend Stateless/full widget
  Widget build(BuildContext context) {
    //runApp tell flutter to render something in the screen, therefore we need a build method

    return MaterialApp(
      home: Scaffold(
        // scaffold is a widget imported from material.dart that gives a base page design to the app (ctrl + space to check all the possible arguments)
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: questionIndex < questions.length
            ? Quiz()
            : Center(
                child: Text(
                    "This is the district we think might fit your preferences the most"),
              ),
      ),
    );
  }
}
