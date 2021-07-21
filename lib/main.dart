import 'package:bank_system/pages/consult_balance_page.dart';
import 'package:bank_system/pages/create_page.dart';
import 'package:bank_system/pages/credit_page.dart';
import 'package:bank_system/pages/operations_page.dart';
import 'package:bank_system/shared/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
part 'routes.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.orange,
      primaryColor: AppColors.primary,
    ),
    debugShowCheckedModeBanner: false,
    routes: routes,
  ));
}
