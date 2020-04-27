import "package:flutter/material.dart";

class Answer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text("Answer 1"),
        onPressed:
            null, //onPressed takes a function, we call it without parentesis. Point the function instead of executing it. Think about tv example.
      ),
    );
  }
}
