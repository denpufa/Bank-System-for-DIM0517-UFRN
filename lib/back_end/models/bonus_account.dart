import 'package:bank_system/back_end/models/account.dart';

class BonusAccount extends Account {
  BonusAccount({
    this.cumulativePoints = 10,
    this.receivedForPoints = 0,
    required int number,
  }) : super(number: number, currentValue: 0);
  int cumulativePoints;
  double receivedForPoints;
}
