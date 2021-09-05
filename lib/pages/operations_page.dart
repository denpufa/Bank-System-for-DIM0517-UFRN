import 'package:flutter/material.dart';

class OperationsPage extends StatefulWidget {
  const OperationsPage({Key? key}) : super(key: key);

  @override
  _OperationsPageState createState() => _OperationsPageState();
}

class _OperationsPageState extends State<OperationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("GitBak"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/consult-balance');
              },
              child: const Text("Consultar saldo"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/credit');
              },
              child: const Text("Creditar"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/debit');
              },
              child: const Text("Debitar"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/transfer');
              },
              child: const Text("Transferência"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profit');
              },
              child: const Text("Render poupança"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profit');
              },
              child: const Text("Render poupança"),
            ),
          ],
        ),
      ),
    );
  }
}
