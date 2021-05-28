import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/Model/Question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question("The us declaratoin of independence was adapted in 1775", true),
    Question("Is thsi a better place to live ?", false),
    Question("This world is so cruel to the human beings", false),
    Question("This is very bad in india", true),
    Question("One should accept it no matter, what may ever be true", false),
    Question("Once this world was a peace of shame", false),
    Question("This is just pathetic to live here", false),
    Question("The us5 is just killing on people", true),
    Question("The people are so dumb after looking at us", true),
    Question(
        "The area is equal to multiplicatio of lenngth of its bredth", true),
    Question("The world is not a better place to live", false),
    Question("This is a very vast subject in the history of demons", false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            children: [
              Center(
                  child:
                      Image.asset("images/flag.png", width: 250, height: 180)),
              Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid)),
                height: 120,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    questionBank[_currentQuestionIndex].questionText,
                    style: TextStyle(fontSize: 16.9, color: Colors.white),
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: () => _prevQuestion(),
                      color: Colors.blueGrey.shade900,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => _checkAnswer(true, context),
                      color: Colors.blueGrey.shade900,
                      child:
                          Text("TRUE", style: TextStyle(color: Colors.white)),
                    ),
                    RaisedButton(
                      onPressed: () => _checkAnswer(false, context),
                      color: Colors.blueGrey.shade900,
                      child: Text(
                        "FALSE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => _nextQuestion(),
                      color: Colors.blueGrey.shade900,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, var context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      // Correct answer
      debugPrint("Yes, Correct");
      final snackBar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text("Yaay!, you are correct!."));
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    } else {
      debugPrint("Incorrect!");
      final snackBar = SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text("Oh no!, Its incorrect!"));
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
