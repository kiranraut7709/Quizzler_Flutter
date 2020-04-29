import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text(
            'General Quiz❓',
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAns(bool userPickedAns) {
    setState(() {
      //Check if we reached at last question or not
      if (quizBrain.isFinished() == true) {
        //Pop up the Alert window when we reached at last question
        Alert(
          context: context,
          title: 'Quiz Finished!',
          desc: 'You\'ve solved all the questions. The Quiz is ended!',
        ).show();
        //Reset the questionNo back to 0
        quizBrain.reset();
        //Clear the scoreKeeper
        scoreKeeper.clear();
      } else {
        if (quizBrain.getAnswer() == userPickedAns) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        //Calling getNextQuestion() method
        quizBrain.getNextQuestion();
      }
    });
  }
//  List<String> questions = [
//    'You can lead a cow down stairs but not up stairs.',
//    'Approximately one quarter of human bones are in the feet.',
//    'A slug\'s blood is green.',
//  ];
//  List<bool> answers = [
//    false,
//    true,
//    true,
//  ];
//
//  Question q1 = Question(
//    q: 'You can lead a cow down stairs but not up stairs.',
//    a: false,
//  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //Questions
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        //True Button
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAns(true);
              },
            ),
          ),
        ),
        //False Button
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAns(false);
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        //ScoreKeeper
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
