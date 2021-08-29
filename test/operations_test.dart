import 'package:bank_system/back_end/operations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
