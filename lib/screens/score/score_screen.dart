import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quiz_application/constant.dart';
import 'package:quiz_application/controllers/question_controllers.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionControllers _qnController = Get.put(QuestionControllers());
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            children: [
              Spacer(
                flex: 3,
              ),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qnController.numOfCorrectAns * 10} / ${_qnController.questions.length * 10}",
                //"${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                //"${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(
                flex: 3,
              )
            ],
          ),
        )
      ]),
    );
  }
}
