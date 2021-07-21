import 'package:bank_system/shared/themes/app_colors.dart';
import 'package:bank_system/shared/themes/app_images.dart';
import 'package:bank_system/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
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
              bottom: size.height * 0.07,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.logo,
                      width: size.width * 0.20, height: size.height * 0.10),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 70, right: 70),
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
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.primary),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/create');
                          },
                          child: Text("Cadastrar Conta"),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.primary),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/operations');
                          },
                          child: Text("Operações"),
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
