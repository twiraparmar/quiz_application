import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quiz_application/controllers/question_controllers.dart';
import 'package:quiz_application/screens/quiz/body.dart';
import 'package:websafe_svg/websafe_svg.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionControllers _controller = Get.put(QuestionControllers());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:
          AppBar(elevation: 0, backgroundColor: Colors.transparent, actions: [
        TextButton(
            onPressed: () {
              _controller.nextQuestion();
            },
            child: Text(
              "Skip",
              style: TextStyle(color: Colors.white),
            ))
      ]),
      body: Body(),
    );
  }
}
