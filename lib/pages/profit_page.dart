import 'package:bank_system/back_end/operations.dart';
import 'package:flutter/material.dart';

class ProfitPage extends StatefulWidget {
  const ProfitPage({Key? key}) : super(key: key);

  @override
  _ProfitPageState createState() => _ProfitPageState();
}

class _ProfitPageState extends State<ProfitPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                  const Text("Render pounpança"),
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
                      labelText: "digite o número da conta",
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          try {
                            ops.savingsProfits(
                                int.parse(_valueController.text));
                            showDialog<AlertDialog>(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    title: Text("sucesso!"),
                                    content: Text("rendimento realizado"),
                                  );
                                });
                          } catch (e) {
                            print(e.toString());
                            showDialog<AlertDialog>(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    title: Text("erro!"),
                                    content: Text("rendimento não realizado"),
                                  );
                                });
                          }
                        }
                      },
                      child: const Text("Render"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
