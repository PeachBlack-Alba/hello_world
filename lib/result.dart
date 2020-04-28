import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final int resultScore;

  //Constructor
  //Positional argument, but we could have used also a named argument {}
  Result(this.resultScore);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 6) {
      resultText =
          "The district we think might fit your preferences the most is: Mitte";
    } else if (resultScore <= 9) {
      resultText =
          "The district we think might fit your preferences the most is: Friedrichshain";
    } else if (resultScore <= 12) {
      resultText =
          "The district we think might fit your preferences the most is: Kreuzberg";
    } else {
      resultText =
          "The district we think might fit your preferences the most is: Neükllon";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(40),
      child: Text(resultPhrase,
          style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left),
    );
  }
}
