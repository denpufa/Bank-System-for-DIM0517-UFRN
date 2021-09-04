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
    Operation op = Operation();
    final created = op.createAccount(123, 'Bônus');
    final credit = op.credit(123, 100.0);
    expect(created.currentValue, equals(credit));
  });

  test("debit", () {
    Operation op = Operation();
    op.createAccount(155, 'simples');
    op.debit(155, 1);
    //need mock accounts because their note can be add Accounts on test
    //expect(Data.accounts[0].currentValue, equals(-1));
  });
  test("transfer", () {
    Operation op = Operation();
    op.createAccount(2, 'simples');
    op.createAccount(3, 'simples');
    op.transfer(2, 3, 1);
    //need mock accounts because their note can be add Accounts on test
    //expect(Data.accounts[0].currentValue,-1);
    //expect(Data.accounts[1].currentValue,1);
  });
}
