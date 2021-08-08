import 'account.dart';

class AccountSaving extends Account {
  bool savingsAcount;

  AccountSaving({
    required int number,
    required this.savingsAcount,
  }) : super(number: number, currentValue: 0);
}
