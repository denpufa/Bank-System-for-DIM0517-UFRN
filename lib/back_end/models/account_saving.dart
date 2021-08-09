import 'account.dart';

class AccountSaving extends Account {
  bool savingsAcount;
  double initCurrentValue;

  AccountSaving({
    required int number,
    required this.savingsAcount,
    required this.initCurrentValue,
  }) : super(number: number, currentValue: initCurrentValue);
}
