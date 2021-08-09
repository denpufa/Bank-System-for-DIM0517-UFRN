import 'package:bank_system/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:bank_system/back_end/operations.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  List<String> accounts = ['Simples', 'Poupança', 'Bônus'];

  String dropdownValue = 'Simples';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _valueSavingsController = TextEditingController();
  var ops = Operation();
  bool isSavings = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GitBak"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text("Criar conta"),
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
                    Visibility(
                      visible: dropdownValue == 'Poupança',
                      child: TextFormField(
                        controller: _valueSavingsController,
                        validator: (value) {
                          if (value == "") {
                            return "digite um valor";
                          }
                        },
                        autovalidateMode: AutovalidateMode.always,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Valor Inicial",
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: AppColors.primary,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: AppColors.primary,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: accounts
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    // Row(
                    //   children: [
                    //     Text("Marqui aqui para conta poupança"),
                    //     SizedBox(width: 10),
                    //     Checkbox(
                    //       value: isSavings,
                    //       onChanged: (bool? value) {
                    //         setState(() {
                    //           isSavings = value!;
                    //         });
                    //       },
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 15),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            try {
                              ops.createAccount(
                                  int.parse(_numberController.text),
                                  dropdownValue,
                                  initSavingsValue: double.parse(
                                      _valueSavingsController.text));
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
                        child: Text("Criar conta"))
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
