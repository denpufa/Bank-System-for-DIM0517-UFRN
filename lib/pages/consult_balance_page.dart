import 'package:bank_system/back_end/operations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ConsultBalancePage extends StatefulWidget {
  const ConsultBalancePage({Key? key}) : super(key: key);

  @override
  _ConsultBalancePageState createState() => _ConsultBalancePageState();
}

class _ConsultBalancePageState extends State<ConsultBalancePage> {
  final GlobalKey<FormState> _formKeyBalance = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();

  Operation ops = Operation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Consultar Saldo"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKeyBalance,
                child: Column(
                  children: <Widget>[
                    const Text("Consultar saldo da conta"),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _numberController,
                      validator: (String? value) {
                        if (value == "") {
                          return "digite um número";
                        }
                      },
                      autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "número da conta",
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKeyBalance.currentState!.validate()) {
                            try {
                              ops.consultBalance(
                                  int.parse(_numberController.text));
                              showDialog<AlertDialog>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Consulta realizada:"),
                                      content: Text('Saldo: R\$ ' +
                                          ops
                                              .consultBalance(int.parse(
                                                  _numberController.text))
                                              .toString()),
                                    );
                                  });
                            } catch (e) {
                              print(e.toString());
                              showDialog<AlertDialog>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      title: Text("erro!"),
                                      content: Text("erro no cadastro"),
                                    );
                                  });
                            }
                          }
                        },
                        child: const Text("Consultar"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
