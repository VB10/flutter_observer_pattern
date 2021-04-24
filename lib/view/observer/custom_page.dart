import 'package:flutter/material.dart';

import 'custom_oberver.dart';

class CustomPage extends StatelessWidget {
  late final CounterManager manager;

  CustomPage() {
    manager = CounterManager();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          manager.increment();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: TextTitle(
          initData: (data) {
            manager.attach(data);
          },
        ),
      ),
    );
  }
}

class TextTitle extends StatefulWidget {
  final void Function(Counter data) initData;

  const TextTitle({Key? key, required this.initData}) : super(key: key);
  @override
  _TextTitleState createState() => _TextTitleState();
}

class _TextTitleState extends State<TextTitle> {
  late final Counter counter;
  CounterModel? model;
  @override
  void initState() {
    super.initState();
    counter = Counter((data) {
      setState(() {
        model = data;
      });
    });
    widget.initData(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Text('${model?.data ?? ''}');
  }
}
