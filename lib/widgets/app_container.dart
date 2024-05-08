import 'package:flutter/material.dart';
import 'package:high_five_app/theme/colors.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  const AppContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.purple30,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: child,
    );
  }
}