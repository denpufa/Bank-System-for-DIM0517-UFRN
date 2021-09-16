import 'package:bank_system/back_end/operations.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _numberFromController = TextEditingController();
  final TextEditingController _numberToController = TextEditingController();
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
                    const Text("Transferência"),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _numberFromController,
                      validator: (String? value) {
                        if (value == "") {
                          return "digite um número";
                        }
                      },
                      autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "número da conta a debitar",
                      ),
                    ),
                    TextFormField(
                      controller: _numberToController,
                      validator: (String? value) {
                        if (value == "") {
                          return "digite um número";
                        }
                      },
                      autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "número da conta a creditar",
                      ),
                    ),
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
                        labelText: "valor a ser transferido",
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            try {
                              ops.transfer(
                                  int.parse(_numberFromController.text),
                                  int.parse(_numberToController.text),
                                  double.parse(_valueController.text));

                              showDialog<AlertDialog>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      title: Text("sucesso!"),
                                      content: Text("Transferência realizada!"),
                                    );
                                  });
                            } catch (e) {
                              print(e.toString());
                              showDialog<AlertDialog>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      title: Text("erro!"),
                                      content:
                                          Text("Transferência não realizada!"),
                                    );
                                  });
                            }
                          }
                        },
                        child: const Text("Transferir"))
                  ],
                ),
              )
            ])));
  }
}
