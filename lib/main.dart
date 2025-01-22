import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'pages/home_inventory.dart';
import 'pages/selected_product.dart';
import 'pages/user_to_database.dart';
import 'pages/callWebService.dart';
import 'pages/register_inventory.dart';
import 'pages/signin_inventory.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (!Platform.isAndroid && !Platform.isIOS) {
    // Initialize FFI for desktop
    sqfliteFfiInit();
    // Change default factory for desktop
    databaseFactory = databaseFactoryFfi;
  }

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => RegisterIn(),
      '/database': (context) => const DatabaseUserInterface(),
      '/home': (context) => const MyHomePage(),
      '/selection': (context) => const selectedProduct(),
      '/callwebservice': (context) => const CallBillingResource(),
      '/singininventory': (context) => const SingIn(),
    },
  ));
}