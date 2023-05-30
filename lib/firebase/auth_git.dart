import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<Map<String, dynamic>> signInWithGitHub(BuildContext context) async {
  // Create a new provider
  GithubAuthProvider githubProvider = GithubAuthProvider();

  final UserCredential =
      await FirebaseAuth.instance.signInWithProvider(githubProvider);

  final User user = UserCredential.user!;
  bool userExists = false;

  // Verificar si el usuario ya existe en Firebase

  final Map<String, dynamic> userInfo = {
    'name': user.displayName,
    'image': user.photoURL!,
    'email': user.email
  };
  print(user);
  Navigator.pushNamed(context, '/dash');
  return userInfo;
}
