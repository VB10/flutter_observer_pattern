import 'package:flutter/material.dart';

import 'view/observer/custom_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: CustomPage());
  }
}
