import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_application/constant.dart';
import 'package:quiz_application/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Welcome_Screen extends StatelessWidget {
  const Welcome_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/saumya.svg", fit: BoxFit.fill),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(
                  flex: 2, // it will take 2/6
                ),
                Text(
                  "સૌમ્યાની ક્વિઝમાં આપનું સ્વાગત છે, તો ચાલો તપાસ કરીએ કે સૌમ્યા વિશે તમે કેટલું જાણો છો",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text("Enter your information below \n"),

                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0XFF1C2341),
                      hintText: "Full Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                ),
                Spacer(), //1 /6
                InkWell(
                  onTap: () {
                    Get.to(QuizScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(kDefaultPadding * 0.75),
                    decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      "Let's Start",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                ),
                Spacer(
                  flex: 2, // it will take2/6
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
