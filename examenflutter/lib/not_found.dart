import 'dart:ui';

import 'package:flutter/material.dart';

class NotFoundView extends StatelessWidget {
  static String rootName = "/not-found";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Page introuvable ", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
