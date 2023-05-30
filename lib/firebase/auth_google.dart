import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screeen/login_screen.dart';

class AuthGoogle {
  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    ;
    final user = userCredential.user;
    // Obtener el nombre y el correo electrónico del usuario
    final displayName = user!.displayName;
    final email = user.email;
    final image = user.photoURL;

    // Aquí puedes agregar el código para guardar los datos en Firebase
    // utilizando el nombre y el correo electrónico obtenidos
    print('entre a 1 sing');
    // Ejemplo: Guardar los datos en Firestore

    print('Usuario creado exitosamente: ${user}');

    metodo(context);
    return userCredential;
  }

  void metodo(BuildContext context) {
    Navigator.pushNamed(context, '/dash'); // Navegar a la pantalla '/login'
  }

  // Future<UserCredential> signInWithGoogle2(BuildContext context) async {
  //   final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication gAuth = await gUser!.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: gAuth.accessToken,
  //     idToken: gAuth.idToken,
  //   );
  //   final userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //   _firebase.verificarCampoContrasena(context);
  //   return userCredential;
  // }

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // // Future<bool> checkUserExistence(
  // //   BuildContext context,
  // //   String email,
  // // ) async {
  // //   try {
  // //     List<String> signInMethods =
  // //         await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
  // //     final currentUser = _auth.currentUser;
  // //     print(currentUser);

  // //     signInWithGoogle2(context);

  // //     return signInMethods.isNotEmpty;
  // //   } catch (e) {
  // //     signInWithGoogle(context);
  // //     print('Error al verificar la existencia del usuario: $e');
  // //     return false; // O manejar el error de otra forma
  // //   }
  // // }

  // // Verifica si el usuario está autenticado
  // Future<void> verificarYCrearUsuario(BuildContext context) async {
  //   print('arrived');
  //   final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication gAuth = await gUser!.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: gAuth.accessToken,
  //     idToken: gAuth.idToken,
  //   );
  //   final userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //   final user = userCredential.user;
  //   final displayName = user!.displayName;
  //   final email = user.email;
  //   final image = user.photoURL;
  //   var signInMethods1 = await FirebaseAuth.instance
  //       .fetchSignInMethodsForEmail(user.email.toString());
  // }

  // verificacionEmail() {}
  // Future<void> borrarUsuario() async {
  //   final User? currentUser = _auth.currentUser;

  //   if (currentUser != null) {
  //     try {
  //       // Elimina el usuario de Firebase Authentication
  //       await currentUser.delete();

  //       // Elimina el documento del usuario en Firestore
  //       await _firestore.collection('users').doc(currentUser.uid).delete();

  //       print('Usuario eliminado exitosamente: ${currentUser.uid}');
  //     } catch (e) {
  //       print('Error al eliminar el usuario: $e');
  //     }
  //   } else {
  //     print('No hay usuario autenticado.');
  //   }
  // }
}
