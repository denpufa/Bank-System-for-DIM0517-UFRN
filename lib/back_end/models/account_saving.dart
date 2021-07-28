import 'account.dart';

class AccountSaving extends Account {
  bool isSaving;
  AccountSaving({required int number, required this.isSaving})
      : super(number: number, currentValue: 0);
}
