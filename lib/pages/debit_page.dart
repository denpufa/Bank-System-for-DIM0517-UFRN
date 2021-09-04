import 'package:bank_system/back_end/operations.dart';
import 'package:flutter/material.dart';

class DebitPage extends StatefulWidget {
  const DebitPage({Key? key}) : super(key: key);

  @override
  _DebitPageState createState() => _DebitPageState();
}

class _DebitPageState extends State<DebitPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  Operation ops = Operation();

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
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const Text("Debitar"),
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
                      labelText: "valor a debitar",
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          try {
                            ops.debit(int.parse(_numberController.text),
                                double.parse(_valueController.text));
                            showDialog<AlertDialog>(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    title: Text("sucesso!"),
                                    content: Text("debito realizado"),
                                  );
                                });
                          } catch (e) {
                            print(e.toString());
                            showDialog<AlertDialog>(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    title: Text("erro!"),
                                    content: Text("debito no cadastro"),
                                  );
                                });
                          }
                        }
                      },
                      child: const Text("Debitar"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
