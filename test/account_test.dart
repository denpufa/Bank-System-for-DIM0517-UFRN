import 'package:bank_system/back_end/models/account.dart';
import 'package:bank_system/back_end/models/bonus_account.dart';
import 'package:bank_system/back_end/operations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Account c;
  test("class Account", () {
    c = Account(number: 300, currentValue: 200.1);

    expect(c.number, equals(300));
    expect(c.currentValue, equals(200.1));
  });
  test("create account simples", () {
    final Operation op = Operation();
    final Account created = op.createAccount(123, 'Simples');
    final Account ac = Account(number: 123, currentValue: 0);
    expect(created.currentValue, equals(ac.currentValue));
    expect(created.number, equals(ac.number));
    expect(created.runtimeType, equals(ac.runtimeType));
  });

  test("create account Bônus", () {
    final Operation op = Operation();
    final dynamic created = op.createAccount(123, 'Bônus');
    final BonusAccount ac = BonusAccount(
      number: 123,
    );
    expect(created.currentValue, equals(ac.currentValue));
    expect(created.number, equals(ac.number));
    expect(created.runtimeType, equals(ac.runtimeType));
  });
}
