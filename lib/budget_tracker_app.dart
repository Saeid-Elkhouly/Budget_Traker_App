import 'package:budget_tracker_app/core/routing/routes.dart';
import 'package:budget_tracker_app/core/routing/routing.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BudgetTrackerApp extends StatelessWidget {
  const BudgetTrackerApp({super.key, required this.routing});
  final Routing routing;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Budget Tracker App',
        initialRoute: Routes.loginView,
        onGenerateRoute: routing.generateRoute,
      ),
    );
  }
}
