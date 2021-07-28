import 'package:bank_system/back_end/operations.dart';
import 'package:flutter/material.dart';

class ProfitPage extends StatefulWidget {
  const ProfitPage({Key? key}) : super(key: key);

  @override
  _ProfitPageState createState() => _ProfitPageState();
}

class _ProfitPageState extends State<ProfitPage> {
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
                  Text("Render pounpança"),
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
                      labelText: "digite o número da conta",
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          try {
                            ops.savingsProfits(
                                int.parse(_valueController.text));
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("sucesso!"),
                                    content: Text("rendimento realizado"),
                                  );
                                });
                          } catch (e) {
                            print(e.toString());
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("erro!"),
                                    content: Text("rendimento não realizado"),
                                  );
                                });
                          }
                        }
                      },
                      child: Text("Render"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
