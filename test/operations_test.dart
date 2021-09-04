import 'package:bank_system/back_end/models/account.dart';
import 'package:bank_system/back_end/operations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("consult balance", () {
    final Operation op = Operation();
    final Account created = op.createAccount(123, 'Poupança');
    final double consult = op.consultBalance(123);
    expect(created.currentValue, equals(consult));
  });

  test("credit", () {
    final Operation op = Operation();
    final Account created = op.createAccount(123, 'Bônus');
    final double credit = op.credit(123, 100.0);
    expect(created.currentValue, equals(credit));
  });
}
