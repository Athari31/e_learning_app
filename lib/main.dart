import 'package:e_learning_app/root/app_root.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'repos/db/shared_pref/shared_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,),
     SharedHelper.init()
  ]);
  runApp(const AppRoot());
}

