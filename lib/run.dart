import 'package:flutter/material.dart';
import 'package:ses_sion_1_7/auth/presentation/pages/signUpPage.dart';

import 'common/theme.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: SignUpPage());
    }
}