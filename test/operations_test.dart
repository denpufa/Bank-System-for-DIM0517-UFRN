import 'package:bank_system/back_end/data.dart';
import 'package:bank_system/back_end/models/account.dart';
import 'package:bank_system/back_end/operations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("create account", () {
    Operation op = Operation();
    var created = op.createAccount(123);
    Account ac = Account(number: 123, currentValue: 0);
    expect(created.currentValue, equals(ac.currentValue));
    expect(created.number, equals(ac.number));
  });

  test("transfer test", () {
    Operation op = Operation();
    op.createAccount(10);
    op.createAccount(3);
    op.transfer(10, 3, 20);
    expect(Data.accounts[0].currentValue, equals(-20));
    expect(Data.accounts[1].currentValue, equals(20));
  });

  test("debit test", () {
    Operation op = Operation();
    op.createAccount(10);
    op.debit(10, 20);
    expect(Data.accounts[0].currentValue, equals(-20));

  test("consult balance", () {
    Operation op = Operation();
    var created = op.createAccount(123);
    var consult = op.consultBalance(123);
    expect(created.currentValue, equals(consult));
  });

  test("credit", () {
    Operation op = Operation();
    var created = op.createAccount(123);
    var credit = op.credit(123, 100.0);
    expect(created.currentValue, equals(credit));
  });
}
