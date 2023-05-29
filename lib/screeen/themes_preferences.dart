import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/temas.dart';

class ThemesPreferences extends StatefulWidget {
  const ThemesPreferences({super.key});

  @override
  State<ThemesPreferences> createState() => _ThemesPreferencesState();
}

class _ThemesPreferencesState extends State<ThemesPreferences> {
  List<bool> _buttonStates = [false, false, false];

  void _updateSelectedButton(int index) {
    setState(() {
      _buttonStates = _buttonStates.map((state) => false).toList();
      _buttonStates[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider tema = Provider.of<ThemeProvider>(context);

    const spaceHorizontal = SizedBox(
      height: 10,
    );

    final txtbutton = ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 13, 13, 13)),
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 77, 113, 164)),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        child: const Text('OK'),
      ),
    );

    return Material(
      child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/theme_selection.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.8)),
          child: SizedBox(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(221, 214, 214, 0.19),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: const BorderSide(
                                color: Color.fromRGBO(255, 178, 122, 1),
                              ),
                            ),
                            primary: Colors.white,
                            backgroundColor:
                                const Color.fromRGBO(88, 89, 90, 0.239),
                          ),
                          onPressed: () {
                            tema.cambiarTemaOscuro();
                          },
                          child: const Icon(Icons.nightlight,
                              color: Color.fromRGBO(32, 83, 134, 1)),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: const BorderSide(
                                color: Color.fromRGBO(255, 178, 122, 1),
                              ),
                            ),
                            primary: Colors.white,
                            backgroundColor:
                                const Color.fromRGBO(88, 89, 90, 0.239),
                          ),
                          onPressed: () {
                            tema.cambiarTemaClaro();
                          },
                          child: const Icon(Icons.sunny,
                              color: Color.fromRGBO(255, 178, 122, 1)),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: const BorderSide(
                                color: Color.fromRGBO(255, 178, 122, 1),
                              ),
                            ),
                            primary: Colors.white,
                            backgroundColor:
                                const Color.fromRGBO(88, 89, 90, 0.239),
                          ),
                          onPressed: () {
                            tema.cambiarTemaPersonalizado();
                          },
                          child: const Icon(Icons.auto_awesome,
                              color: Color.fromRGBO(196, 111, 235, 1)),
                        ),
                        spaceHorizontal,
                        txtbutton,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ))),
    );
  }
}
