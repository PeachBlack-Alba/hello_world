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
  //This variable we created it outside the build, otherwise would run everytime it builds the page
  var questionIndex = 0;
  var totalScore = 0;
  //We need to create a var to store the score, then in the function we will make the sum of the total score
  //We want that after the button is pressed, the new question appears so we change the index of the question+1
  //We need to tell flutter we are changing the state by answering and when it does, it should rerender the widget
  //The int score we recieve it from quiz.dart () => answerQuestion(answer["score"]
  void answerQuestion(int score) {
    totalScore = totalScore + score;
    //Next forward the totalscore to the result widget to render different results
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
//After quiz reset:

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  } //Then pass it to Result widget

  final questions = const [
    // const here because this list will not change
    {
      "questionText": "What is your idea of a perfect Sunday?",
      "answers": [
        {"text": "Sitting next to the canal whilst eating a pizza", "score": 3},
        {"text": "Going to a museum", "score": 1},
        {"text": "Going to a flea market", "score": 2},
        {
          "text": "Gathering with friends in a large field having a picnic",
          "score": 4
        },
      ],
    },
    {
      "questionText": "What type of cuisine do you prefer?",
      "answers": [
        {"text": "Asian", "score": 1},
        {"text": "Italian", "score": 2},
        {"text": "Arab", "score": 4},
        {"text": "Turkish", "score": 3},
      ],
    },
    {
      "questionText": "What kind of building architecture you prefer?",
      "answers": [
        {"text": "Alternative", "score": 4},
        {"text": "Modern", "score": 1},
        {"text": "With graffiti", "score": 3},
        {"text": "Sovietic", "score": 2},
      ],
    },
    {
      "questionText": "What is your favourite attraction?",
      "answers": [
        {"text": "East side gallery", "score": 2},
        {"text": "Tempelhof field", "score": 4},
        {"text": "Canal", "score": 3},
        {"text": "Brandennburg gate", "score": 1},
      ],
    },
    {
      "questionText": "What do you prefer?",
      "answers": [
        {"text": "Eat the best kebab in Berlin", "score": 3},
        {"text": "Visit WWII sites", "score": 1},
        {"text": "Go to a hidden swimming pool", "score": 2},
        {
          "text": "Go to a top roof terrace to enjoy Berlin's views",
          "score": 4
        },
      ],
    },
    {
      "questionText": "When it comes to clothes shopping, what do you prefer?",
      "answers": [
        {"text": "Fashion stores", "score": 1},
        {"text": "Boutiques", "score": 2},
        {"text": "Cheap second hand shops", "score": 4},
        {"text": "Hipster second hand shops", "score": 3},
      ],
    },
  ];

  @override
  //decorator from DART dependencies that makes code cleaner
  // every widget needs to extend Stateless/full widget
  Widget build(BuildContext context) {
    //runApp tell flutter to render something in the screen, therefore we need a build method
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Remove debug
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
      ),

      home: Scaffold(
        // scaffold is a widget imported from material.dart that gives a base page design to the app (ctrl + space to check all the possible arguments)
        appBar: AppBar(
          title: Text("District Finder"),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: questions,
              )
            : Result(totalScore, resetQuiz),
      ),
    );
  }
}
