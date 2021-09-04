part of 'main.dart';

Map<String, WidgetBuilder> routes = <String, Widget Function(BuildContext)>{
  '/': (BuildContext context) => const HomePage(),
  '/create': (BuildContext context) => const CreatePage(),
  '/operations': (BuildContext context) => const OperationsPage(),
  '/consult-balance': (BuildContext context) => const ConsultBalancePage(),
  '/credit': (BuildContext context) => const CreditPage(),
  '/debit': (BuildContext context) => const DebitPage(),
  '/transfer': (BuildContext context) => const TransferPage(),
  '/savings': (BuildContext context) => const SavingsPage(),
  '/profit': (BuildContext context) => const ProfitPage()
};
