import 'package:bank_system/back_end/models/bonus_account.dart';

import 'data.dart';
import './models/account.dart';
import './models/account_saving.dart';

class Operation {
  double tax = 10;

  Account createAccount(int number, String accountType,
      {double? initSavingsValue}) {
    var created;
    if (accountType == 'Poupança') {
      created = AccountSaving(
        initCurrentValue: initSavingsValue ?? 0,
        number: number,
        savingsAcount: true,
      );
    } else if (accountType == 'Bônus') {
      created = BonusAccount(
        number: number,
      );
    } else {
      created = Account(number: number, currentValue: 0);
    }

    Data.accounts.add(created);
    return created;
  }

  void transfer(int from, int to, double value) {
    cumulativeTransferPoints(to, value);
    Data.accounts.forEach((a) {
      if (a.number == from) {
        if (a.runtimeType == AccountSaving) {
          if (!(a.currentValue - value < 0)) {
            a.currentValue -= value;
          } else {
            return;
          }
        } else {
          if (a.currentValue - value > -1000) {
            a.currentValue -= value;
          } else {
            return;
          }
        }
      } else if (a.number == to) {
        a.currentValue += value;
      }
    });
  }

  void debit(int number, double value) {
    Data.accounts.forEach((a) {
      if (a.number == number) {
        if (a.runtimeType == AccountSaving) {
          print("oi c");
          if (!((a.currentValue - value) < 0)) {
            print("oi a");
            a.currentValue -= value;
          }
        } else {
          if ((a.currentValue - value) > -1000) {
            a.currentValue -= value;
          }
        }
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

  void pointsAccumulatedDeposit(int number) {
    Data.accounts.forEach((a) {
      if (a.number == number) {
        if (a.runtimeType == BonusAccount) {
          a.cumulativePoints += (a.currentValue / 100).toInt();
          print(a.cumulativePoints);
        }
      }
    });
  }

  void cumulativeTransferPoints(int number, double value) {
    Data.accounts.forEach((a) {
      if (a.number == number) {
        if (a.runtimeType == BonusAccount) {
          if (a.receivedForPoints >= 150) {
            a.cumulativePoints += 1;
          } else {
            a.receivedForPoints += value;
          }

          print(a.cumulativePoints);
        }
      }
    });
  }

  double credit(int number, double value) {
    double creditValue = 0.0;
    Data.accounts.forEach((element) {
      if (element.number == number) {
        element.currentValue += value;
        creditValue = element.currentValue;
      }
    });
    pointsAccumulatedDeposit(number);
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
