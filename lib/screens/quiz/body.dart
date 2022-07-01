import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_application/constant.dart';
import 'package:quiz_application/controllers/question_controllers.dart';
import 'package:quiz_application/models/questions.dart';
import 'package:quiz_application/screens/quiz/pregressbar.dart';
import 'package:quiz_application/screens/quiz/question_card.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //So we have access to controller
    QuestionControllers _questionController = Get.put(QuestionControllers());

    return Stack(fit: StackFit.expand, children: [
      WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: ProgressBar(),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(TextSpan(
                      text:
                          "Question ${_questionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                            text: "/${_questionController.questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: kSecondaryColor))
                      ])),
                )),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(height: kDefaultPadding),
            Expanded(
                child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: _questionController.updateTheQnnum,
              controller: _questionController.pageController,
              itemCount: _questionController.questions.length,
              itemBuilder: (context, index) =>
                  QuestionCard(question: _questionController.questions[index]),
            )),
          ],
        ),
      )
    ]);
  }
}
