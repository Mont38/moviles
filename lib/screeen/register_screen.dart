import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:path/path.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();

  File? _image;
  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        this._image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final txtEmail = TextFormField(
      decoration: const InputDecoration(
          label: Text('Email'), enabledBorder: OutlineInputBorder()),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese su correo ";
        }
        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return "Please enter a valid email address";
        }
        return null;
      },
    );
    final txtPass = TextFormField(
        controller: _textController,
        decoration: const InputDecoration(
            label: Text('password'), enabledBorder: OutlineInputBorder()),
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) {
            return "Ingrese su contrasenia ";
          }
          return null;
        });

    final SpaceHorizontal = SizedBox(
      height: 10,
    );
    final txtName = TextFormField(
      decoration: const InputDecoration(
          label: Text('Name'), enabledBorder: OutlineInputBorder()),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese su nombre ";
        }
        return null;
      },
    );

    final RoundedLoadingButtonController btnok =
        RoundedLoadingButtonController();

    void _doSomething() async {
      Timer(Duration(seconds: 1), () {
        if (_formkey.currentState!.validate()) {
          btnok.success();
        } else {
          btnok.error();
        }
        Timer(Duration(seconds: 5), () {
          btnok.reset();
        });
      });
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/backRegister.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.8)),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(129.0),
                            child: _image != null
                                ? Image.file(_image!,
                                    width: 250, height: 250, fit: BoxFit.cover)
                                : Image.network(
                                    'https://i.pinimg.com/564x/c8/29/90/c82990d8b80c30481cd32572732b5809.jpg',
                                    height: 250,
                                  ),
                          ),
                          SizedBox(height: 10),
                          CustomBotton(
                            title: 'Pick image from Gallery',
                            icon: Icons.image_outlined,
                            onClick: () => getImage(ImageSource.gallery),
                          ),
                          CustomBotton(
                              title: 'Pick image from camera',
                              icon: Icons.camera,
                              onClick: () => getImage(ImageSource.camera)),
                          SizedBox(height: 10),
                          txtEmail,
                          SpaceHorizontal,
                          txtPass,
                          SpaceHorizontal,
                          txtName,
                          SpaceHorizontal,
                          SpaceHorizontal,
                          RoundedLoadingButton(
                            color: Color.fromARGB(255, 174, 209, 174),
                            child: const Text(
                              'Registrarme',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 54, 74, 54)),
                            ),
                            controller: btnok,
                            onPressed: _doSomething,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}

Widget CustomBotton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: 240,
      child: ElevatedButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(10, 40))),
          onPressed: onClick,
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(
                  color: Color.fromARGB(255, 54, 74, 54),
                ),
              )
            ],
          )));
}
