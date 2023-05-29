import 'package:app1/screeen/list_post_screen.dart';
import 'package:app1/settings/styles.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
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

  @override
  Widget build(BuildContext context) {
    FlagsProvider flags = Provider.of<FlagsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bueno para las cuentas'),
      ),
      body: flags.getflagListPost() == true
          ? const ListPostScreen()
          : ListPostScreen(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _opencustoeDialog();
          },
          icon: Icon(Icons.add_comment),
          label: Text('add post')),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/564x/15/5e/a4/155ea4a6a22db66e8bf1eaba7349ffd8.jpg'),
                ),
                accountName: Text('Natanael Cano'),
                accountEmail: Text('rancho@humilde.com.mx')),
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
