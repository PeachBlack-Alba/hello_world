import "package:flutter/material.dart";

class Answer extends StatelessWidget {
  //Creat constructor (it needs to have the same name as class)
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      // margin: const EdgeInsets.only(top: 10.0),
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(16.0),
            side: BorderSide(color: Colors.white)),
        color: Colors.deepPurple,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed:
            selectHandler, //onPressed takes a function, we call it without parentesis. Point the function instead of executing it. Think about tv example.
      ),
    );
  }
}
