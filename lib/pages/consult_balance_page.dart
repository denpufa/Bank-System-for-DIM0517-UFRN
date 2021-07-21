import 'package:bank_system/back_end/operations.dart';
import 'package:flutter/material.dart';

class ConsultBalancePage extends StatefulWidget {
  const ConsultBalancePage({Key? key}) : super(key: key);

  @override
  _ConsultBalancePageState createState() => _ConsultBalancePageState();
}

class _ConsultBalancePageState extends State<ConsultBalancePage> {
  final GlobalKey<FormState> _formKeyBalance = GlobalKey<FormState>();
  TextEditingController _numberController = TextEditingController();

  var ops = Operation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Consultar Saldo"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKeyBalance,
                child: Column(
                  children: [
                    Text("Consultar saldo da conta"),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: _numberController,
                      validator: (value) {
                        if (value == "") {
                          return "digite um número";
                        }
                      },
                      autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "número da conta",
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKeyBalance.currentState!.validate()) {
                            try {
                              ops.consultBalance(
                                  int.parse(_numberController.text));
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Consulta realizada:"),
                                      content: Text('Saldo: R\$ ' +
                                          ops
                                              .consultBalance(int.parse(
                                                  _numberController.text))
                                              .toString()),
                                    );
                                  });
                            } catch (e) {
                              print(e.toString());
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("erro!"),
                                      content: Text("erro no cadastro"),
                                    );
                                  });
                            }
                          }
                        },
                        child: Text("Consultar"))
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
