import 'package:bank_system/pages/consult_balance_page.dart';
import 'package:bank_system/pages/create_page.dart';
import 'package:bank_system/pages/credit_page.dart';
import 'package:bank_system/pages/debit_page.dart';
import 'package:bank_system/pages/operations_page.dart';
import 'package:bank_system/pages/profit_page.dart';
import 'package:bank_system/pages/savings_page.dart';
import 'package:bank_system/pages/transfer_page.dart';
import 'package:bank_system/pages/home_page.dart';
import 'package:bank_system/shared/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
