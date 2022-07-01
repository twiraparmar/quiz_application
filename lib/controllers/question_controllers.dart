import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_application/models/questions.dart';
import 'package:quiz_application/screens/score/score_screen.dart';

// we uses this package to our state management
class QuestionControllers extends GetxController
    with GetSingleTickerProviderStateMixin {
  late Animation _animation;
  // So we can access  our animation outside
  Animation get animation => _animation;
  late AnimationController _animationController;
  late PageController _pageController;
  PageController get pageController => _pageController;
  final List<Questions> _question = sample_data
      .map((question) => Questions(
          id: question['id'],
          question: question['question'],
          options: question['options'],
          answer: question['answer_index']))
      .toList();

  List<Questions> get questions => this._question;
  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  late int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  //Called  immediaterly after the widget is allocated memory
  @override
  void onInit() {
    // TODO: implement onInit
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 50));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        //update like setstate
        update();
      });

    // start our animation
    // Once 60s is complted go to the next qn
    _animationController.forward().whenComplete(() => nextQuestion());
    _pageController = PageController();
    super.onInit();
  }

  //Called just before the controller is deleted from memory
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
  }

  void checkAns(Questions questions, int selectedIndex) {
    //because when user press anu question it will run
    _isAnswered = true;
    _correctAns = questions.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
    }

// IT will stop the counter
    _animationController.stop();
    update();
//Once use selct ans in 3 sec it will go next
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _question.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(microseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();
      // then start it again

      // out timer is finish goto nect qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(const ScoreScreen());
    }
  }

  void updateTheQnnum(int index) {
    _questionNumber.value = index + 1;
  }
}
