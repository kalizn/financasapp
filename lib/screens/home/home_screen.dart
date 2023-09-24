import 'package:financasapp/responsive.dart';
import 'package:flutter/material.dart';

import '../../theme_app.dart';
import 'components/header.dart';
import 'components/my_fields.dart';
import 'components/recent_files.dart';
import 'components/balance_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      primary: false,
      padding: const EdgeInsets.all(ThemeApplication.defaultPadding),
      child: Column(
        children: [
          const Header(),
          const SizedBox(
            height: ThemeApplication.defaultPadding,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    const MyFiles(),
                    const SizedBox(height:ThemeApplication.defaultPadding,),
                    RecentFiles(),
                    if (Responsive.isMobile(context))
                      const SizedBox(height: ThemeApplication.defaultPadding,),
                    if (Responsive.isMobile(context)) const BalanceDetails(),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                const SizedBox(width: ThemeApplication.defaultPadding,),
              if (!Responsive.isMobile(context))
                const Expanded(flex: 2, child: BalanceDetails(),)
            ],
          )
        ],
      ),
    ));
  }
}
