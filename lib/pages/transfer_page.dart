import 'package:bank_system/back_end/operations.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _numberFromController = TextEditingController();
  TextEditingController _numberToController = TextEditingController();
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Text("Transferência"),
                SizedBox(height: 30),
                TextFormField(
                  controller: _numberFromController,
                  validator: (value) {
                    if (value == "") {
                      return "digite um número";
                    }
                  },
                  autovalidateMode: AutovalidateMode.always,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "número da conta a debitar",
                  ),
                ),
                TextFormField(
                  controller: _numberToController,
                  validator: (value) {
                    if (value == "") {
                      return "digite um número";
                    }
                  },
                  autovalidateMode: AutovalidateMode.always,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "número da conta a creditar",
                  ),
                ),
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
                    labelText: "valor a ser transferido",
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        try {
                          ops.transfer(
                              int.parse(_numberFromController.text),
                              int.parse(_numberToController.text),
                              double.parse(_valueController.text));

                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("sucesso!"),
                                  content: Text("Transferência realizada!"),
                                );
                              });
                        } catch (e) {
                          print(e.toString());
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("erro!"),
                                  content: Text("Transferência não realizada!"),
                                );
                              });
                        }
                      }
                    },
                    child: Text("Transferir"))
              ],
            ),
          )
        ])));
  }
}
