import 'data.dart';
import './models/account.dart';

class Operation {
  Account createAccount(int number) {
    Account created = Account(number: number, currentValue: 0);
    Data.accounts.add(created);
    return created;
  }

  void transfer(int from, int to, double value) {
    Data.accounts.forEach((a) {
      if (a.number == from) {
        a.currentValue -= value;
      } else if (a.number == to) {
        a.currentValue += value;
      }
    });
  }

  void debit(int number, double value) {
    Data.accounts.forEach((a) {
      if (a.number == number) {
        a.currentValue -= value;
      }
    });
  }
}
