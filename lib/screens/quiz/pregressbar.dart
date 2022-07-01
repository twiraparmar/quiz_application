import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_application/constant.dart';
import 'package:quiz_application/controllers/question_controllers.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xff3f4768),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuestionControllers>(
          init: QuestionControllers(),
          builder: (controller) {
            print(controller.animation.value);
            return Stack(children: [
              // Layoutbuilder provide us the available space for the container
              // constraints.maxwidth needed for out animation
              LayoutBuilder(
                  builder: (context, contraints) => Container(
                        // From 0 to 1 it takes 60s
                        width: contraints.maxWidth * controller.animation.value,
                        decoration: BoxDecoration(
                            gradient: kPrimaryGradient,
                            borderRadius: BorderRadius.circular(50)),
                      )),
              Positioned.fill(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${(controller.animation.value * 60).round()} Sec"),
                    WebsafeSvg.asset("assets/icons/clock.svg")
                  ],
                ),
              ))
            ]);
          }),
    );
  }
}
