import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
  QuizzQuestion quizzQuestion = QuizzQuestion();
  int questionNumber = 0;
  int score = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = QuizzQuestion.getCorrectAnswer();

    setState(() {
      if (QuizzQuestion.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finit',
          desc: 'Votre score est de ' + score.toString(),
        ).show();
        QuizzQuestion.reset();
        score = 0;
      } else {
        if (userPickedAnswer == correctAnswer) {
          score = score + 1;
        }
        QuizzQuestion.nextQuestion();
      }
    });
  }

  void checkAnswerNext() {
    bool correctAnswer = QuizzQuestion.getCorrectAnswer();

    setState(() {
      if (QuizzQuestion.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finit',
          desc: 'Votre score est de ' + score.toString(),
        ).show();
        QuizzQuestion.reset();
        score = 0;
      } else {
        QuizzQuestion.nextQuestion();
      }
    });
  }

  Widget build(BuildContext context) {
    String url = QuizzQuestion.getImage();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                QuizzQuestion.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.black,
              child: Text(
                'Suivant',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswerNext();
              },
            ),
          ),
        ),
      ],
    );
  }
}
