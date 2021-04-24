import 'package:flutter/material.dart';

enum PathEnums { VB, HWA }

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(PathEnums.VB.toString());
  }
}
