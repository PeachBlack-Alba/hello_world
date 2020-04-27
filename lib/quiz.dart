import "package:flutter/material.dart";

import "./question.dart";
import "./answer.dart";

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // <Widget>[] tells dart that the list is going to be a list of widgets
      children: [
        Question(
          questions[questionIndex]["questionText"],
          // ["questionText"] we are selecting that key of the object
        ), //the ... avoids a nested list => Question list + map() list, this ... takes the value of map() list and puts in in the existing list
        ...(questions[questionIndex]["answers"] as List<String>).map((answer) {
          return Answer(answerQuestion, answer);
        }).toList()
      ],
    );
  }
}
