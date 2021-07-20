import 'data.dart';
import './models/account.dart';

class Operation {
  Account createAccount(int number) {
    Account created = Account(number: number, currentValue: 0);
    Data.accounts.add(created);
    return created;
  }
}
