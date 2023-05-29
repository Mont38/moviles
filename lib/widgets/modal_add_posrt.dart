import 'package:app1/database/database_helpert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/flags_provider.dart';

class ModalAddPost extends StatefulWidget {
  ModalAddPost({super.key});

  @override
  State<ModalAddPost> createState() => _ModalAddPostState();
}

class _ModalAddPostState extends State<ModalAddPost> {
  DatabaseHelper? database;
  TextEditingController textDescPost = TextEditingController();
  @override
  void initState() {
    super.initState();
    database = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    FlagsProvider flags = Provider.of<FlagsProvider>(context);
    return AlertDialog(
      title: Text('Add post'),
      content: SizedBox(
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              maxLines: 5,
            ),
            IconButton(
                onPressed: () {
                  database!.INSERTAR('tblPost', {
                    'dscPost': textDescPost.text,
                    'datePost': DateTime.now().toString(),
                  }).then((value) {
                    var msg = value > 0 ? 'insertao' : 'errror';
                    final snackBar = SnackBar(content: Text(msg));
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    flags.setflagListPost();
                  });
                },
                icon: Icon(Icons.add)),
          ],
        ),
      ),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
