import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:high_five_app/router/router.dart';
import 'package:high_five_app/screens/result/bloc/result_bloc.dart';
import 'package:high_five_app/theme/colors.dart';
import 'package:high_five_app/widgets/action_button_widget.dart';
import 'package:high_five_app/widgets/app_container.dart';

@RoutePage()
class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPurple,
      appBar: AppBar(
        backgroundColor: AppColors.bgPurple,
        leadingWidth: 110,
        leading: Row(
          children: [
            SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                context.router.push(SettingsRoute());
              },
              child: Text(
                'Settings',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: AppColors.accentOrange,
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            create: (context) => ResultBloc()..add(GetResultEvent()),
            child: BlocConsumer<ResultBloc, ResultState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is EmptyResultState) {
                  return Center(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Poker chance',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 34,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Spacer(flex: 1),
                        Image.asset('assets/images/result/empty-result.png'),
                        SizedBox(height: 10),
                        Text(
                          'Start analyzing your victories',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 28,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          'Analyze your successes and keep track of victories according to various parameters',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: AppColors.lightPurple,
                          ),
                        ),
                        SizedBox(height: 20),
                        ActionButtonWidget(
                          text: 'Start',
                          width: double.infinity,
                          onTap: () {
                            context.router.push(AnalysisRoute());
                          },
                        ),
                        Spacer(flex: 2),
                      ],
                    ),
                  );
                } else if (state is LoadedResultState) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Poker chance',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 34,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Your result',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                            color: AppColors.purple30,
                            borderRadius: BorderRadius.all(Radius.circular(16.0))),
                        child: Column(
                          children: [
                            Text(
                              '${state.result.result}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 32,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                                width: 150,
                                child: Divider(
                                  thickness: 1,
                                  color: AppColors.white70,
                                ),),
                            SizedBox(height: 10),
                            Text(
                              '${state.result.subtitle}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.white70,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '${state.result.message}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      ActionButtonWidget(
                        text: 'New analysis',
                        width: double.infinity,
                        onTap: () {
                          context.router.push(AnalysisRoute());
                        },
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
