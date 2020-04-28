import "package:flutter/material.dart";
import "./question.dart";
import "./answer.dart";

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  //We need to know what question is, so we need also the index
  final int questionIndex;
  final Function answerQuestion;
  //constructor
//with {} are "named" arguments
  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      //<Widget>[] tells dart that the list is going to be a list of widgets
      children: [
        Question(
          questions[questionIndex]["questionText"],
          //["questionText"] we are selecting that key of the object
        ), //The ... avoids a nested list => Question list + map() list, this ... takes the value of map() list and puts in in the existing list
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer["score"]),
              answer["text"]); //In [] what we want to forward
        }).toList()
      ],
    );
  }
}
