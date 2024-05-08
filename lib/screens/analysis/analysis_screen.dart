import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:high_five_app/models/result_model.dart';
import 'package:high_five_app/router/router.dart';
import 'package:high_five_app/screens/analysis/widgets/button_selection_component.dart';
import 'package:high_five_app/screens/result/bloc/result_bloc.dart';
import 'package:high_five_app/theme/colors.dart';
import 'package:high_five_app/widgets/action_button_widget.dart';
import 'package:high_five_app/widgets/textfield_app_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

@RoutePage()
class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final controller = PageController();
  int _currentIndex = 0;

  String game = '';
  String opponent = '';
  String strategy = '';
  final amountController = TextEditingController();
  String cards = 'A pair of aces';
  String bet = '';
  String bluffing = '';
  final bluffingTimesController = TextEditingController();
  String mainFactor = 'Successful bluffs';
  String outcome = 'Winning';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPurple,
      appBar: AppBar(
        backgroundColor: AppColors.bgPurple,
        leadingWidth: 110,
        leading: GestureDetector(
          onTap: () {
            context.router.push(ResultRoute());
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: AppColors.accentOrange),
                SizedBox(width: 4),
                Text(
                  'Back',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    color: AppColors.accentOrange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'New analysis',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 34,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${_currentIndex + 1}/9',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: StepProgressIndicator(
                            padding: 0,
                            roundedEdges: Radius.circular(30),
                            totalSteps: 9,
                            currentStep: _currentIndex + 1,
                            selectedColor: AppColors.white,
                            unselectedColor: AppColors.purple30,
                            size: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  controller: controller,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Select a game',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ButtonSelectionComponent(buttonValues: [
                                  'Poker',
                                  'Baccarat',
                                  'Brag',
                                  'Badugi',
                                  'Texas hold\'em',
                                  'Pai Gow poker',
                                ], value: game),
                              ],
                            ),
                            SizedBox(height: 20),
                            ActionButtonWidget(
                                text: 'Next',
                                width: MediaQuery.of(context).size.width * 0.8,
                                onTap: () {
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                }),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'How many opponents do you have?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ButtonSelectionComponent(buttonValues: [
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                  '5+'
                                ], value: opponent),
                              ],
                            ),
                            SizedBox(height: 20),
                            ActionButtonWidget(
                                text: 'Next',
                                width: MediaQuery.of(context).size.width * 0.8,
                                onTap: () {
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                }),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'What strategy did you use in this game?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ButtonSelectionComponent(buttonValues: [
                                  'Aggressive',
                                  'Conservative',
                                  'Balanced',
                                  'None'
                                ], value: strategy),
                              ],
                            ),
                            SizedBox(height: 20),
                            ActionButtonWidget(
                                text: 'Next',
                                width: MediaQuery.of(context).size.width * 0.8,
                                onTap: () {
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                }),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextFieldAppWidget(
                              controller: amountController,
                              title: 'What bet did you place?',
                              hintText: 'Sum',
                            ),
                            SizedBox(height: 20),
                            ActionButtonWidget(
                                text: 'Next',
                                width: MediaQuery.of(context).size.width * 0.8,
                                onTap: () {
                                  if (amountController.text.isNotEmpty &&
                                      int.tryParse(amountController.text) !=
                                          null) {
                                    controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: AppColors.accentOrange,
                                        content: Text(
                                          'Firstly, enter information',
                                          style:
                                              TextStyle(color: AppColors.white),
                                        ),
                                      ),
                                    );
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'What cards did you have at the beginning of the game?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    _buildCardsButton('A pair of aces'),
                                    SizedBox(height: 15),
                                    _buildCardsButton(
                                        'Cards of the same suit, but low'),
                                    SizedBox(height: 15),
                                    _buildCardsButton(
                                        'One card of each suit, including high cards'),
                                    SizedBox(height: 15),
                                    _buildCardsButton('I do not remember'),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            ActionButtonWidget(
                                text: 'Next',
                                width: MediaQuery.of(context).size.width * 0.8,
                                onTap: () {
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                }),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'What bets did you place during the game?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ButtonSelectionComponent(buttonValues: [
                                  'Doubled the bet',
                                  'Set the minimum',
                                  'Raised the bet',
                                  'None'
                                ], value: bet),
                              ],
                            ),
                            SizedBox(height: 20),
                            ActionButtonWidget(
                                text: 'Next',
                                width: MediaQuery.of(context).size.width * 0.8,
                                onTap: () {
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                }),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Were you bluffing?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ButtonSelectionComponent(
                                    buttonValues: ['Yes', 'No'],
                                    value: bluffing),
                              ],
                            ),
                            SizedBox(height: 10),
                            TextFieldAppWidget(
                              controller: bluffingTimesController,
                              title: 'How many times?',
                              hintText: 'Times',
                            ),
                            SizedBox(height: 20),
                            ActionButtonWidget(
                                text: 'Next',
                                width: MediaQuery.of(context).size.width * 0.8,
                                onTap: () {
                                  if (bluffingTimesController.text.isNotEmpty &&
                                      int.tryParse(
                                              bluffingTimesController.text) !=
                                          null) {
                                    controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: AppColors.accentOrange,
                                        content: Text(
                                          'Firstly, enter information',
                                          style:
                                              TextStyle(color: AppColors.white),
                                        ),
                                      ),
                                    );
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'What cards did you have at the beginning of the game?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    _buildFactorsButton('Successful bluffs'),
                                    SizedBox(height: 15),
                                    _buildFactorsButton(
                                        'Winning card combinations'),
                                    SizedBox(height: 15),
                                    _buildFactorsButton(
                                        'Incorrect assessment of opponents actions'),
                                    SizedBox(height: 15),
                                    _buildFactorsButton('I do not remember'),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            ActionButtonWidget(
                                text: 'Next',
                                width: MediaQuery.of(context).size.width * 0.8,
                                onTap: () {
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                }),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'What cards did you have at the beginning of the game?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    _buildOutcomeButton('Winning'),
                                    SizedBox(height: 15),
                                    _buildOutcomeButton('Loss'),
                                    SizedBox(height: 15),
                                    _buildOutcomeButton('Draw'),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            ActionButtonWidget(
                                text: 'Next',
                                width: MediaQuery.of(context).size.width * 0.8,
                                onTap: () {
                                  int resultIndex = Random().nextInt(4);
                                  context
                                      .read<ResultBloc>()
                                      .add(AddResultEvent(result: results[resultIndex]));
                                  context.router.push(ResultRoute());
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardsButton(String title) {
    return GestureDetector(
      onTap: () => _onCardsButtonPressed(title),
      child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: cards == title
                ? AppColors.accentOrange
                : AppColors.accentPurple,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          width: double.infinity,
          child: Center(
              child: Text(title,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white)))),
    );
  }

  void _onCardsButtonPressed(String title) {
    setState(() {
      cards = title;
    });
  }

  Widget _buildFactorsButton(String title) {
    return GestureDetector(
      onTap: () => _onFactorButtonPressed(title),
      child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: mainFactor == title
                ? AppColors.accentOrange
                : AppColors.accentPurple,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          width: double.infinity,
          child: Center(
              child: Text(title,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white)))),
    );
  }

  void _onFactorButtonPressed(String title) {
    setState(() {
      mainFactor = title;
    });
  }

  Widget _buildOutcomeButton(String title) {
    return GestureDetector(
      onTap: () => _onOutcomeButtonPressed(title),
      child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: outcome == title
                ? AppColors.accentOrange
                : AppColors.accentPurple,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          width: double.infinity,
          child: Center(
              child: Text(title,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white)))),
    );
  }

  void _onOutcomeButtonPressed(String title) {
    setState(() {
      outcome = title;
    });
  }
}

final List<ResultModel> results = [
  ResultModel(result: 'Experienced player',
      subtitle: 'You have a balanced style. You flexibly adapt to different situations in the game.',
      message: 'You skillfully use bluffs and manage bets depending on the combination of cards, most likely have a good strategic foundation.',
  ),
  ResultModel(result: 'Average player',
    subtitle: 'Your game is decent, but there is room for improvement.',
    message: ' You understand the rules and basic strategies of card games, but you may need to work on your decision-making and reading opponents moves to become a more competitive player.',
  ),
  ResultModel(result: 'Above average player',
    subtitle: 'You have a solid foundation and show potential for growth.',
    message: 'Your ability to analyze situations and make calculated decisions sets you apart from other players. With practice and refinement, you have the potential to become a formidable opponent at the card table.',
  ),
  ResultModel(result: 'Strong player',
    subtitle: 'You are a skilled and experienced player.',
    message: 'Your mastery of card games is evident in your strategic gameplay and insightful decision-making. You have a knack for reading opponents, making well-timed bluffs, and maximizing your winning potential. Keep up the good work and continue honing your skills to dominate the card table.',
  ),
];
