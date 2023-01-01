import 'package:bloc_example/item/ui/item_viewer.dart';
import 'package:flutter/material.dart';

import 'item/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Item item = const Item('item #1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        const Text('HELLO MY FRIEND'),
        ElevatedButton(
            onPressed: _changeData, child: const Text('Change data!')),
        ItemWrapper(item),
      ]),
    );
  }

  void _changeData() {
    setState(() {
      item = const Item('new item - #2!');
    });
  }
}
