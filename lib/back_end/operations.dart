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
    Data.accounts.forEach((element) {
      if (element.number == number) {
        balance = element.currentValue;
      }
    });

    return balance;
  }

  double credit(int number, double value) {
    double creditValue = 0.0;
    Data.accounts.forEach((element) {
      if (element.number == number) {
        element.currentValue += value;
        creditValue = element.currentValue;
      }
    });

    return creditValue;
  }
}
