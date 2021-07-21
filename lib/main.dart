import 'package:bank_system/pages/consult_balance_page.dart';
import 'package:bank_system/pages/create_page.dart';
import 'package:bank_system/pages/operations_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
part 'routes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: routes,
  ));
}
