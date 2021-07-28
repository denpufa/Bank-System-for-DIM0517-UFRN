part of 'main.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => HomePage(),
  '/create': (context) => CreatePage(),
  '/operations': (context) => OperationsPage(),
  '/consult-balance': (context) => ConsultBalancePage(),
  '/credit': (context) => CreditPage(),
  '/debit': (context) => DebitPage(),
  '/transfer': (context) => TransferPage(),
  '/savings': (context) => SavingsPage(),
  '/profit': (context) => ProfitPage()
};
