import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Holder extends StatefulWidget{
  @override
  State<Holder> createState() => _HolderState();
}

class _HolderState extends State<Holder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
            onPressed: (){
              exit(0);
            },
            child: Text("ВЫХОД")),
      ),
    );
  }
}