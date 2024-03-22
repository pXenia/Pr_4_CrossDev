import 'package:flutter/material.dart';

import 'Item.dart';

class EarnedScreen extends StatefulWidget {
  const EarnedScreen({super.key});

  @override
  State<EarnedScreen> createState() => _EarnedScreen();
}

class _EarnedScreen extends State<EarnedScreen> {
  List<Item> items = [
    Item(text: 'Зарплата', number: 90000),
    Item(text: 'Премия', number: 10000),
    Item(text: 'Подарок', number: 3000),
    Item(text: 'Зарплата', number: 90000),
    Item(text: 'Премия', number: 10000),
    Item(text: 'Подарок', number: 3000),
    Item(text: 'Зарплата', number: 90000),
    Item(text: 'Премия', number: 10000),
    Item(text: 'Подарок', number: 3000),
    Item(text: 'Зарплата', number: 90000),
    Item(text: 'Премия', number: 10000),
    Item(text: 'Подарок', number: 3000),
    Item(text: 'Зарплата', number: 90000),
    Item(text: 'Премия', number: 10000),
    Item(text: 'Подарок', number: 3000),
  ];

  final _textController = TextEditingController();
  final _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                for (Item item in items) _buildItem(item),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Сумма: ${_itemSum(items)}"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple.shade100,
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
  int _itemSum(List<Item> itemsList){
    int sum = 0;
    itemsList.forEach((element) {sum+= element.number;});
    return sum;

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
              child: const Text('Отмена')),
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

