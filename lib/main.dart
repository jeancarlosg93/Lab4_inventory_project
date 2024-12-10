import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'pages/home_inventory.dart';
import 'pages/selected_product.dart';
import 'pages/user_to_database.dart';

void main() {
  if (!Platform.isAndroid && !Platform.isIOS) {
    // Initialize FFI for desktop
    sqfliteFfiInit();
    // Change default factory for desktop
    databaseFactory = databaseFactoryFfi;
  }

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => DatabaseUserInterface(),
      '/home': (context) => const MyHomePage(),
      '/selection': (context) => const selectedProduct(),
    },
  ));
}
