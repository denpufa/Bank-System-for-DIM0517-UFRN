import 'package:bank_system/back_end/models/account.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Account c;
  test("class Account", () {
    c = Account(number: 300, currentValue: 200.1);

    expect(c.number, equals(300));
    expect(c.currentValue, equals(200.1));
  });
}
