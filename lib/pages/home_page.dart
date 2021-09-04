import 'package:bank_system/shared/themes/app_colors.dart';
import 'package:bank_system/shared/themes/app_images.dart';
import 'package:bank_system/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Container(
              color: AppColors.primary,
              width: size.width,
              height: size.height * 0.36,
            ),
            Positioned(
              left: 0,
              top: 50,
              right: 0,
              child: Image.asset(AppImages.person, width: 208, height: 300),
            ),
            Positioned(
              bottom: size.height * 0.05,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 70, right: 70),
                    child: Text(
                      'Seu banco digital',
                      style: TextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.primary),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/create');
                          },
                          child: const Text("Cadastrar Conta"),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.primary),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/operations');
                          },
                          child: const Text("Operações"),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.primary),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/savings');
                          },
                          child: const Text("Render juros"),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.primary),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/savings');
                          },
                          child: Text("Render juros"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
