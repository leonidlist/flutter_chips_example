import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView()
    );
  }
}
class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int counter = 0;
  List<Widget> _widgetList = List<Widget>();

  @override
  void initState() {
    for(int i = 0; i < 5; i++) {
      var child = _newItem(i);
      _widgetList.add(child);
      counter++;
    }
    super.initState();
  }

  void _onClicked() {
    var child = _newItem(counter);
    setState(() {
      _widgetList.add(child);
      counter++;
    });
  }

  Widget _newItem(int i) {
    var key = Key('item $i');

    return Container(
      key: key,
      padding: EdgeInsets.all(10),
      child: Chip(
        label: Text('$i name here'),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: () => _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade500,
          child: Text(i.toString()),
        ),
      ),
    );
  }

  void _removeItem(Key key) {
    for(var item in _widgetList) {
      if(item.key == key) {
        setState(() {
          _widgetList.remove(item);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onClicked,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: _widgetList,
          ),
        ),
      ),
    );
  }
}