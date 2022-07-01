import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_application/constant.dart';
import 'package:quiz_application/controllers/question_controllers.dart';
import 'package:quiz_application/models/questions.dart';

import 'options.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Questions question;

  @override
  Widget build(BuildContext context) {
    QuestionControllers _controller = Get.put(QuestionControllers());
    return Container(
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: kBlackColor),
            ),
            SizedBox(height: kDefaultPadding / 2),
            ...List.generate(
              question.options.length,
              ((index) => Option(
                  text: question.options[index],
                  press: () => _controller.checkAns(question, index),
                  index: index)),
            ),
          ],
        ));
  }
}
