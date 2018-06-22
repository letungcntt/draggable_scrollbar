import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(DragScrollBarDemo());

class DragScrollBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drag Scroll Bar',
      home: MyHomePage(title: 'Flutter Drag Scroll Bar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: DraggableScrollbar.asGooglePhotos(
              dynamicLabelTextBuilder: (double offset) => "${offset ~/ 100}",
              controller: _controller,
              child: ListView.builder(
                controller: _controller,
                itemCount: 1000,
                itemExtent: 100.0,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.purple[index % 9 * 100],
                      child: Center(
                        child: Text(index.toString()),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
