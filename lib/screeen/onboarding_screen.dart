import 'package:app1/screeen/card_data.dart';
import 'package:app1/screeen/login_screen.dart';
import 'package:app1/screeen/themes_preferences.dart';
import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:lottie/lottie.dart';

class OnboardinsScreen extends StatelessWidget {
  OnboardinsScreen({super.key});
  final controller = PageController();
  final data = [
    CardData(
        title: "INSTITUTO TECNOLOGICO NACIONAL DE MEXICO",
        description:
            "El instituto tecnologico nacional de mexico es una institucion de educacion ",
        image: AssetImage("assets/linces.jpg"),
        backgroundColor: Color.fromARGB(255, 2, 6, 49),
        titleColor: Color.fromARGB(255, 104, 203, 172),
        descriptionColor: Color.fromARGB(255, 131, 126, 126),
        background: Positioned(
            top: 40, child: LottieBuilder.asset('assets/back6.json'))),
    CardData(
        title: "Ingenieria en Sistemas Computacionales",
        description:
            "La ingenieria en sistemas computacionales es un campo interdiciplinario de la ingenieria",
        image: AssetImage("assets/sistemitas.jpg"),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        titleColor: Color.fromARGB(255, 49, 51, 181),
        descriptionColor: Color.fromARGB(255, 158, 151, 151),
        background: Positioned(
            top: 20, child: LottieBuilder.asset('assets/back2.json'))),
    CardData(
        title: "INSTALATION",
        description: "solo dale sig(:",
        image: AssetImage("assets/setting.jpg"),
        backgroundColor: Color.fromARGB(255, 237, 237, 237),
        titleColor: Color.fromARGB(255, 255, 250, 249),
        descriptionColor: Color.fromARGB(255, 227, 24, 24),
        background: LottieBuilder.asset('assets/background.json')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        itemCount: data.length,
        colors: data.map((e) => e.backgroundColor).toList(),
        itemBuilder: (int index) {
          return CardDatas(data: data[index]);
        },
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ThemesPreferences()),
          );
        },
      ),
    );
  }
}
