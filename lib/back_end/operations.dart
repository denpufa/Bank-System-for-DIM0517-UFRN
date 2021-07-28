import 'data.dart';
import './models/account.dart';
import './models/account_saving.dart';

class Operation {
  double tax = 10;

  Account createAccount(int number, bool isSavings) {
    var created;
    if (isSavings) {
      created = AccountSaving(number: number, isSaving: true);
    } else {
      created = Account(number: number, currentValue: 0);
    }

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

  double savingsProfits(int number) {
    double returnValue = 0;
    Data.accounts.forEach((a) {
      if (a.number == number) {
        if (a.runtimeType == AccountSaving) {
          a.currentValue += (tax * a.currentValue) / 100;
          returnValue = a.currentValue;
        } else {
          returnValue = -1;
        }
      }
    });
    return returnValue;
  }
}
