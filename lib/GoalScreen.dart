import 'package:flutter/material.dart';

import 'Item.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreen();
}

class _GoalScreen extends State<GoalScreen> {
  List<Item> items = [
    Item(text: 'Велосипед', number: 20000),
    Item(text: 'Отпуск', number: 70000),
    Item(text: 'Подарок', number: 3000),
    Item(text: 'Велосипед', number: 20000),
    Item(text: 'Отпуск', number: 70000),
    Item(text: 'Подарок', number: 3000),
    Item(text: 'Велосипед', number: 20000),
    Item(text: 'Отпуск', number: 70000),
    Item(text: 'Подарок', number: 3000),
    Item(text: 'Велосипед', number: 20000),
    Item(text: 'Отпуск', number: 70000),
    Item(text: 'Подарок', number: 3000),

  ];

  final _textController = TextEditingController();
  final _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: items.map((item) => _buildItem(item)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        backgroundColor: Colors.deepPurple.shade100,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildItem(Item item) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Text(item.text),
          ),
          Text('${item.number}'),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                items.remove(item);
              });
            },
          ),
        ],
      ),
    );
  }

  void _addItem() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Добавить элемент'),
        backgroundColor: Colors.grey.shade100,
        content: IntrinsicHeight(
          child: Column(
            children: [
              TextField(
                controller: _textController,
                decoration: const InputDecoration(labelText: 'Название'),
              ),
              TextField(
                controller: _numberController,
                decoration: const InputDecoration(labelText: 'Сумма'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _textController.clear();
              _numberController.clear();
            },
            child: const Text('Отмена')
          ),
          TextButton(
            onPressed: () {
              if (_textController.text.isNotEmpty &&
                  _numberController.text.isNotEmpty) {
                Navigator.pop(context);
                setState(() {
                  items.add(Item(
                      text: _textController.text,
                      number: int.parse(_numberController.text)));
                });
                _textController.clear();
                _numberController.clear();
              }
            },
            child: const Text('Добавить'),
          ),
        ],
      ),
    );
  }
}


