import 'package:bank_system/back_end/models/account.dart';
import 'package:bank_system/back_end/models/bonus_account.dart';
import 'package:bank_system/back_end/operations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("create account simples", () {
    Operation op = Operation();
    var created = op.createAccount(123, 'Simples');
    Account ac = Account(number: 123, currentValue: 0);
    expect(created.currentValue, equals(ac.currentValue));
    expect(created.number, equals(ac.number));
    expect(created.runtimeType, equals(ac.runtimeType));
  });

  test("create account Bônus", () {
    Operation op = Operation();
    dynamic created = op.createAccount(123, 'Bônus');
    BonusAccount ac = BonusAccount(
      number: 123,
    );
    expect(created.runtimeType, equals(ac.runtimeType));
    expect(created.currentValue, equals(ac.currentValue));
    expect(created.number, equals(ac.number));
    expect(created.cumulativePoints, equals(ac.cumulativePoints));
  });

  test("consult balance", () {
    Operation op = Operation();
    var created = op.createAccount(123, 'Poupança');
    var consult = op.consultBalance(123);
    expect(created.currentValue, equals(consult));
  });

  test("credit", () {
    Operation op = Operation();
    var created = op.createAccount(123, 'Bônus');
    var credit = op.credit(123, 100.0);
    expect(created.currentValue, equals(credit));
  });
}
