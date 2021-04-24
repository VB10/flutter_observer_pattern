import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<String> hello(String data) async {
    await Future.delayed(Duration(seconds: 1));

    return data;
  }

  String title = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  children: [
                    Text(title),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          title = value;
                        });
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(Icons.add),
        ),
        body: Center(
          child: buildFutureBuilder(),
        ));
  }

  FutureBuilder<String> buildFutureBuilder() {
    return FutureBuilder<String>(
        future: hello('vb10'),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                return Text(snapshot.data!);
              }
              return Text('not found');

            default:
              return CircularProgressIndicator();
          }
        });
  }
}
