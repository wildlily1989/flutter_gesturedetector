import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my button',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new MyButton(title: 'mybutton'),
    );
  }
}

class MyButton extends StatelessWidget {
  final title;
  MyButton({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My button'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return new Center(
            child: new GestureDetector(
              onTap: () {
                final snackBar = new SnackBar(content: new Text('Tap'));
                Scaffold.of(context).showSnackBar(snackBar);
              },
              child: new Container(
                padding: new EdgeInsets.all(12.0),
                decoration: new BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                child: new Text('My button'),
              ),
            ),
          );
        },
      ),
    );
    return throw UnimplementedError();
  }
}
