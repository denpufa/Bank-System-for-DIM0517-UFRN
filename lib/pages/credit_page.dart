import 'package:bank_system/back_end/operations.dart';
import 'package:flutter/material.dart';

class CreditPage extends StatefulWidget {
  const CreditPage({Key? key}) : super(key: key);

  @override
  _CreditPageState createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  final GlobalKey<FormState> _formKeyCredit = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  Operation ops = Operation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Creditar"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKeyCredit,
                child: Column(
                  children: <Widget>[
                    const Text("Creditar um valor a conta"),
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
                    TextFormField(
                      controller: _valueController,
                      validator: (String? value) {
                        if (value == "") {
                          return "digite um número";
                        }
                      },
                      autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "valor creditado",
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKeyCredit.currentState!.validate()) {
                            try {
                              // print(_valueController.text);
                              final double balance = ops.credit(
                                  int.parse(_numberController.text),
                                  double.parse(_valueController.text));
                              setState(() {});
                              // print(balance);
                              showDialog<AlertDialog>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title:
                                          const Text("Creditado com sucesso:"),
                                      content: Text(
                                          'Saldo: R\$ ' + balance.toString()),
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
                        child: const Text("Creditar"))
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
