import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:high_five_app/router/router.dart';
import 'package:high_five_app/screens/settings/widgets/settings_tile.dart';
import 'package:high_five_app/theme/colors.dart';
import 'package:high_five_app/widgets/app_container.dart';
import 'package:in_app_review/in_app_review.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              AppContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Give us 5 star!',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Your feedback helps us to improve',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/settings/image.png',
                      width: 110,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SettingsTile(
                  iconPath: 'assets/images/settings/terms.svg',
                  title: 'Terms & Conditions',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const ViewRead(
                          gsada:
                              'https://docs.google.com/document/d/1NWA7LvHpff0dMMozautncMacOHnmZsCF9sJKZx2N3hk/edit?usp=sharing',
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 15),
              SettingsTile(
                  iconPath: 'assets/images/settings/privacy.svg',
                  title: 'Privacy Policy',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const ViewRead(
                                gsada:
                                    'https://docs.google.com/document/d/1Ay65OuXjLi1DWAAVGgzQufMSo2ntLyo_dGvqq6T929Y/edit?usp=sharing',
                              )),
                    );
                  }),
              const SizedBox(height: 15),
              SettingsTile(
                  iconPath: 'assets/images/settings/support.svg',
                  title: 'Support Page',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const ViewRead(
                                gsada: 'https://forms.gle/fh6sqWAg6r3jxQ2C8',
                              )),
                    );
                  }),
              SizedBox(height: 15),
              SettingsTile(
                  iconPath: 'assets/images/settings/rate.svg',
                  title: 'Rate Us',
                  onTap: () {
                    InAppReview.instance
                        .openStoreListing(appStoreId: '6502400530');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
