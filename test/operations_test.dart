import 'dart:math';

import 'package:bank_system/back_end/models/account.dart';
import 'package:bank_system/back_end/operations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("create account", () {
    Operation op = Operation();
    var created = op.createAccount(123);
    Account ac = Account(number: 123, currentValue: 0);
    expect(created.currentValue, equals(0));
    expect(created.number, equals(123));
  });
}
