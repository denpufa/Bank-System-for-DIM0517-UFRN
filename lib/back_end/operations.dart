import 'data.dart';
import './models/account.dart';

class Operation {
  Account createAccount(int number) {
    Account created = Account(number: number, currentValue: 0);
    Data.accounts.add(created);
    return created;
  }

  double consultBalance(int number) {
    double balance = 0.0;
    Data.accounts.map((data) {
      if (data.number == number) {
        balance = data.currentValue;
      }
    });

    return balance;
  }
}
