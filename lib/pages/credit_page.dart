import 'package:bank_system/back_end/operations.dart';
import 'package:flutter/material.dart';

class CreditPage extends StatefulWidget {
  const CreditPage({Key? key}) : super(key: key);

  @override
  _CreditPageState createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  final GlobalKey<FormState> _formKeyCredit = GlobalKey<FormState>();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _valueController = TextEditingController();
  var ops = Operation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Creditar"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKeyCredit,
                child: Column(
                  children: [
                    Text("Creditar um valor a conta"),
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
                    TextFormField(
                      controller: _valueController,
                      validator: (value) {
                        if (value == "") {
                          return "digite um número";
                        }
                      },
                      autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "valor creditado",
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKeyCredit.currentState!.validate()) {
                            try {
                              // print(_valueController.text);
                              double balance = ops.credit(
                                  int.parse(_numberController.text),
                                  double.parse(_valueController.text));
                              setState(() {});
                              // print(balance);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Creditado com sucesso:"),
                                      content: Text(
                                          'Saldo: R\$ ' + balance.toString()),
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
                        child: Text("Creditar"))
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
