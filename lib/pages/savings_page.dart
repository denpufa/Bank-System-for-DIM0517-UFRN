import 'package:bank_system/back_end/operations.dart';
import 'package:flutter/material.dart';

class SavingsPage extends StatefulWidget {
  const SavingsPage({Key? key}) : super(key: key);

  @override
  _SavingsPageState createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                  Text("Render juros"),
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
                      labelText: "digite a taxa de juros",
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          try {
                            ops.tax = double.parse(_valueController.text);
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("sucesso!"),
                                    content: Text("cadastro realizado"),
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
                      child: Text("Salvar taxa"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
