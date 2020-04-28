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
//      home: new MyButton(title: 'mybutton'),
//    home: new InkWellButton(),
    home: Slide(),
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

class InkWellButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('InkWell'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return new Center(
            child: new InkWell(
              onTap: (){
                Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text('tap'),));
              },
              child: new Container(
                padding: new EdgeInsets.all(12.0),
                child: new Text('Flat Button'),
              ),
            ),
          );
        },
      )
    );
    throw UnimplementedError();
  }
}

class Slide extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   final items =new List<String>.generate(20, (i) => "Item ${i + 1}");
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Slide'),
      ),
      body: new ListView.builder(
        itemCount: items.length,
          itemBuilder: (context,index){
          final item = items[index];

          return new Dismissible(
              key: new Key(item),
              onDismissed: (direction){
                items.removeAt(index);
                Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text("$item dismissed}"))
                );
              },
          background: new Container(color: Colors.red,),
            child: new ListTile(title: new Text('$items'),),
          );
          }),
    );
    throw UnimplementedError();
  }

}