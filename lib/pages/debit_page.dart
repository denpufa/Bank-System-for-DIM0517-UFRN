import 'package:bank_system/back_end/operations.dart';
import 'package:flutter/material.dart';

class DebitPage extends StatefulWidget {
  const DebitPage({Key? key}) : super(key: key);

  @override
  _DebitPageState createState() => _DebitPageState();
}

class _DebitPageState extends State<DebitPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _valueController = TextEditingController();

  var ops = Operation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GitBak"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Text("Debitar"),
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
                      labelText: "valor a debitar",
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          try {
                            ops.debit(int.parse(_numberController.text),
                                double.parse(_valueController.text));
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("sucesso!"),
                                    content: Text("debito realizado"),
                                  );
                                });
                          } catch (e) {
                            print(e.toString());
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("erro!"),
                                    content: Text("debito no cadastro"),
                                  );
                                });
                          }
                        }
                      },
                      child: Text("Criar"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
