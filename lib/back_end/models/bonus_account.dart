import 'package:bank_system/back_end/models/account.dart';

class BonusAccount extends Account {
  int cumulativePoints;
  double receivedForPoints;
  BonusAccount({
    required int number,
    this.cumulativePoints = 10,
    this.receivedForPoints = 0,
  }) : super(number: number, currentValue: 0);
}
