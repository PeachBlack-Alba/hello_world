import "package:flutter/material.dart";

class Question extends StatelessWidget {
  //Specify that the data will be a String. Will hold the data from the constructor
  //Specify that is final because we are using a statelesswidget, therefore the data from inside can change,
  //but flutter wont render it (UI). So we specify that we won't change the data
  final String questionText;

  //This is the constructor of Question class, so needs to have the same name
  Question(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
