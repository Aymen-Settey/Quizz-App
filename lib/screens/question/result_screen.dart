import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizz_app/configs/themes/custom_test_styles.dart';
import 'package:quizz_app/configs/themes/ui_parameters.dart';
import 'package:quizz_app/controllers/question_paper/questions_controller.dart';
import 'package:quizz_app/controllers/question_paper/questions_controller_extension.dart';
import 'package:quizz_app/screens/question/answer_check_screen.dart';
import 'package:quizz_app/widgets/common/background_decoration.dart';
import 'package:quizz_app/widgets/common/custom_app_bar.dart';
import 'package:quizz_app/widgets/common/main_button.dart';
import 'package:quizz_app/widgets/content_area.dart';
import 'package:quizz_app/controllers/question_paper/questions_controller_extension.dart';
import 'package:quizz_app/widgets/questions/answer_card.dart';
import 'package:quizz_app/widgets/questions/question_number_card.dart';
class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({Key? key}) : super(key: key);
  static const String routeName= "/resultscreen";

  @override
  Widget build(BuildContext context) {
    Color _textColor = Get.isDarkMode?Colors.white:Theme.of(context).primaryColor;
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: const SizedBox(
          height: 80,
        ),
        title: controller.correctAnsweredQuestions,
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
              child: ContentArea(
                child: Column(
                  children: [
                    SvgPicture.asset('assets/images/bulb.svg'),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 5),
                      child: Text(
                        'Congratulations',
                        style: headerText.copyWith(color: _textColor),
                      ),
                    ),
                    Text(
                      'You have ${controller.points} points',
                      style: TextStyle(
                        color: _textColor
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Tap below question numbers to view correct answers',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: controller.allQuestions.length,
                        shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Get.width ~/75,
                            childAspectRatio: 1,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8
                          ),
                          itemBuilder: (_,index){
                           final  _question = controller.allQuestions[index];
                           AnswerStatus _status =AnswerStatus.notanswered;
                           final _selectedAnswer = _question.selectedAnswer;
                           final _correctAnswer = _question.correctAnswer;
                           if(_selectedAnswer==_correctAnswer){
                             _status = AnswerStatus.correct;
                           }else if(_question.selectedAnswer==null){
                             _status = AnswerStatus.wrong;
                           }else{
                             _status = AnswerStatus.wrong;
                           }
                           return QuestionNumberCard(
                               index: index+1,
                               status: _status,
                               onTap: (){
                                 controller.jumpToQuestion(index,isGoBack: false);
                                 Get.toNamed(AnswerCheckScreen.routeName);
                               });

                          }),
                    ),
                    ColoredBox(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Padding(
                        padding: UIParameters.mobileScreenPadding,
                        child: Row(
                          children: [
                            Expanded(
                              child: MainButton(
                                onTap: (){
                                  controller.tryAgain();
                                },
                                color: Colors.blueGrey,
                                title: 'try again',
                              ),
                            ),
                            const SizedBox(width: 5,),
                            Expanded(
                              child: MainButton(
                                onTap: (){
                                  controller.saveTestResult();
                                },
                                color: Colors.blueGrey,
                                title: 'Go home',
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
