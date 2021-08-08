import 'package:bank_system/back_end/models/account.dart';

class BonusAccount extends Account {
  int cumulativePoints;

  BonusAccount({
    required int number,
    this.cumulativePoints = 10,
  }) : super(number: number, currentValue: 0);
}
