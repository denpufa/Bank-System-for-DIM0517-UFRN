import 'account.dart';

class AccountSaving extends Account {
  AccountSaving({
    required int number,
    required this.savingsAcount,
    required this.initCurrentValue,
  }) : super(number: number, currentValue: initCurrentValue);

  bool savingsAcount;
  double initCurrentValue;
}
