import "package:flutter/material.dart";
import "./quiz.dart";
import "./result.dart";

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
      "questionText": "What is your idea of a perfect Sunday?",
      "answers": [
        {
          "text": "Gathering with friends in a large field having a picnic",
          "score": 4
        },
        {"text": "Sitting next to the canal whilst eating a pizza", "score": 3},
        {"text": "Going to a flea market", "score": 2},
        {"text": "Go to a museum", "score": 1},
      ],
    },
    {
      "questionText": "What type of cuisine you prefer?",
      "answers": [
        {"text": "Arabic", "score": 4},
        {"text": "Turkish", "score": 3},
        {"text": "Italian", "score": 2},
        {"text": "Asian", "score": 1},
      ],
    },
    {
      "questionText": "What kind of building architecture you prefer?",
      "answers": [
        {"text": "Old and alternative", "score": 4},
        {"text": "With graffiti", "score": 3},
        {"text": "Sovietic", "score": 2},
        {"text": "Modernist", "score": 1},
      ],
    },
    {
      "questionText": "What is your favourite attraction?",
      "answers": [
        {"text": "Tempelhof field", "score": 4},
        {"text": "Canal", "score": 3},
        {"text": "East side gallery", "score": 2},
        {"text": "Brandennburg gate", "score": 1},
      ],
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
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: questions,
              )
            : Result(),
      ),
    );
  }
}
