import 'package:app1/screeen/list_post_screen.dart';
import 'package:app1/settings/styles.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/flags_provider.dart';
import '../provider/theme_provider.dart';
import '../widgets/modal_add_posrt.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isDarkThemeEnable = false;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bueno para las cuentas'),
      ),
      body: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('${user.photoURL}'),
                ),
                accountName: Text('${user.displayName}'),
                accountEmail: Text('${user.email}')),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(
                    color: Color.fromRGBO(255, 178, 122, 1),
                  ),
                ),
                primary: Colors.white,
                backgroundColor: const Color.fromRGBO(88, 89, 90, 0.239),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/events');
              },
              child: const Icon(Icons.calendar_month,
                  color: Color.fromRGBO(196, 111, 235, 1)),
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
                backgroundColor: const Color.fromRGBO(88, 89, 90, 0.239),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/movies');
              },
              child: const Icon(Icons.movie_creation_outlined,
                  color: Color.fromRGBO(196, 111, 235, 1)),
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
                backgroundColor: const Color.fromRGBO(88, 89, 90, 0.239),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/pokemon');
              },
              child: const Icon(Icons.catching_pokemon_outlined,
                  color: Color.fromRGBO(196, 111, 235, 1)),
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
                backgroundColor: const Color.fromRGBO(88, 89, 90, 0.239),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut().then(
                      (value) => Navigator.pushNamed(context, '/login'),
                    );
              },
              child: const Icon(Icons.exit_to_app,
                  color: Color.fromRGBO(255, 178, 122, 1)),
            ),
          ],
        ),
      ),
    );
  }

  _opencustoeDialog() {
    return showGeneralDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return Transform.scale(
            scale: animation.value,
            child: Opacity(opacity: animation.value, child: ModalAddPost()),
          );
        },
        transitionDuration: Duration(microseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        pageBuilder: (context, animation, secondaryAnimation) {
          return Container();
        });
  }
}
