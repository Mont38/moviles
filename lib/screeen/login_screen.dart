import 'package:app1/firebase/auth_google.dart';
import 'package:app1/screeen/responsive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../firebase/auth_git.dart';
import '../widgets/loading_modal.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//lo debajo son text from donde se ponen los recuadros donde van tanto el correo como la contraseña
//se le puso OutlineInputBorder para poner la linea que rodea los bordes de la caja de texto
final emailController = TextEditingController();
final passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  void singUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pushNamed(context, '/dash');

      print('sing');
    } on FirebaseAuthException catch (e) {}
  }

  final txtEmail = TextFormField(
    controller: emailController,
    decoration: const InputDecoration(
        label: Text('email'),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Color.fromRGBO(255, 123, 137, 0.5),
          ),
        ),
        border: OutlineInputBorder()),
  );
  final txtPass = TextFormField(
    controller: passwordController,
    decoration: const InputDecoration(
        label: Text('password'),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Color.fromRGBO(255, 123, 137, 0.5),
          ),
        ),
        border: OutlineInputBorder()),
    obscureText: true,
  );

  final spaceHorizontal = SizedBox(
    height: 10,
  );
  //Aqui debajo se importó una "libreria" de dev.net que agrega botonos para login de diferentes medias, como google, facebook, etc.

  final btnFace = SocialLoginButton(
      buttonType: SocialLoginButtonType.facebook, onPressed: () {});

  final imgLogo = Image.asset(
    'assets/logo.png',
    height: 200,
  );
  final imgLogoDesktop = Image.asset(
    'assets/logoDes.jpg',
    height: 300,
  );
  final imgLogoTablet = Image.asset(
    'assets/logoDes.jpg',
    height: 200,
  );

  @override
  Widget build(BuildContext context) {
    final btnGoogle = SocialLoginButton(
        buttonType: SocialLoginButtonType.google,
        onPressed: () {
          AuthGoogle().signInWithGoogle(context);
        });

    final txtRegister = Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: const Text(
            'Crear cuenta',
            style:
                TextStyle(fontSize: 18, decoration: TextDecoration.underline),
          )),
    );
    final btnGit = SocialLoginButton(
        buttonType: SocialLoginButtonType.github,
        onPressed: () {
          signInWithGitHub(context);
        });

    final btnEmail = SocialLoginButton(
        buttonType: SocialLoginButtonType.generalLogin,
        onPressed: () {
          isLoading = true;
          setState(() {});
          Future.delayed(Duration(milliseconds: 4000)).then((value) {
            isLoading = false;
            setState(() {});
            singUserIn();
          });
        });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              opacity: .9,
              fit: BoxFit.cover,
              image: AssetImage('assets/Back.jpg'),
            )),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal:
                      30), //aqui se le da un padding horizontal simetrico a las cajas de texto para que estas no abarquen toda la pantalla de forma horizontal
              child: Stack(
                children: [
                  Column(
                    children: [
                      Responsive(
                        mobile: MobileLoginScreen(
                          txtEmail: txtEmail,
                          spaceHorizontal: spaceHorizontal,
                          txtPass: txtPass,
                          btnEmail: btnEmail,
                          btnGoogle: btnGoogle,
                          btnFace: btnFace,
                          btnGit: btnGit,
                          txtRegister: txtRegister,
                          imgLogo: imgLogo,
                        ),
                        desktop: Desktop(
                            imgLogoDesktop: imgLogoDesktop,
                            txtEmail: txtEmail,
                            spaceHorizontal: spaceHorizontal,
                            txtPass: txtPass,
                            btnEmail: btnEmail,
                            btnGoogle: btnGoogle,
                            btnFace: btnFace,
                            btnGit: btnGit),
                        tablet: tablet(
                            imgLogoTablet: imgLogoTablet,
                            txtEmail: txtEmail,
                            spaceHorizontal: spaceHorizontal,
                            txtPass: txtPass,
                            btnEmail: btnEmail,
                            btnGoogle: btnGoogle,
                            btnFace: btnFace,
                            btnGit: btnGit),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          isLoading ? const LoadingModalWidget() : Container()
        ],
      ),
    );
  }
}

class Desktop extends StatelessWidget {
  const Desktop({
    super.key,
    required this.imgLogoDesktop,
    required this.txtEmail,
    required this.spaceHorizontal,
    required this.txtPass,
    required this.btnEmail,
    required this.btnGoogle,
    required this.btnFace,
    required this.btnGit,
  });

  final Image imgLogoDesktop;
  final TextFormField txtEmail;
  final SizedBox spaceHorizontal;
  final TextFormField txtPass;
  final SocialLoginButton btnEmail;
  final SocialLoginButton btnGoogle;
  final SocialLoginButton btnFace;
  final SocialLoginButton btnGit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 230),
          child: Row(
            verticalDirection: VerticalDirection.down,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: imgLogoDesktop,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    txtEmail,
                    spaceHorizontal,
                    spaceHorizontal,
                    txtPass,
                    spaceHorizontal,
                    spaceHorizontal,
                    spaceHorizontal,
                    btnEmail,
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            spaceHorizontal,
                            spaceHorizontal,
                            spaceHorizontal,
                            spaceHorizontal,
                            btnGoogle,
                            spaceHorizontal,
                            btnFace,
                            spaceHorizontal,
                            btnGit,
                            spaceHorizontal,
                          ]),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class tablet extends StatelessWidget {
  const tablet({
    super.key,
    required this.imgLogoTablet,
    required this.txtEmail,
    required this.spaceHorizontal,
    required this.txtPass,
    required this.btnEmail,
    required this.btnGoogle,
    required this.btnFace,
    required this.btnGit,
  });

  final Image imgLogoTablet;
  final TextFormField txtEmail;
  final SizedBox spaceHorizontal;
  final TextFormField txtPass;
  final SocialLoginButton btnEmail;
  final SocialLoginButton btnGoogle;
  final SocialLoginButton btnFace;
  final SocialLoginButton btnGit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 230),
          child: Row(
            verticalDirection: VerticalDirection.down,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: imgLogoTablet,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    txtEmail,
                    spaceHorizontal,
                    spaceHorizontal,
                    txtPass,
                    spaceHorizontal,
                    spaceHorizontal,
                    spaceHorizontal,
                    btnEmail,
                    SizedBox(
                      width: 900,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            spaceHorizontal,
                            spaceHorizontal,
                            spaceHorizontal,
                            spaceHorizontal,
                            btnGoogle,
                            spaceHorizontal,
                            btnFace,
                            spaceHorizontal,
                            btnGit,
                            spaceHorizontal,
                          ]),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    super.key,
    required this.txtEmail,
    required this.spaceHorizontal,
    required this.txtPass,
    required this.btnEmail,
    required this.btnGoogle,
    required this.btnFace,
    required this.btnGit,
    required this.txtRegister,
    required this.imgLogo,
  });

  final TextFormField txtEmail;
  final SizedBox spaceHorizontal;
  final TextFormField txtPass;
  final SocialLoginButton btnEmail;
  final SocialLoginButton btnGoogle;
  final SocialLoginButton btnFace;
  final SocialLoginButton btnGit;
  final Padding txtRegister;
  final Image imgLogo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: imgLogo,
              margin: EdgeInsets.only(bottom: 15),
              height: 200,
            ),
            txtEmail,
            spaceHorizontal,
            txtPass,
            spaceHorizontal,
            btnEmail,
            spaceHorizontal,
            btnGoogle,
            spaceHorizontal,
            btnFace,
            spaceHorizontal,
            btnGit,
            spaceHorizontal,
            txtRegister,
          ],
        ),
      ),
    );
  }
}
