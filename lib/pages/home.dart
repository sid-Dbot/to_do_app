import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:to_do_app/widgets/listItem.dart';

import '../models/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? _setDate;

  TextEditingController taskname = TextEditingController();
  final List<Item> _items = [
    Item(
      id: 1,
      title: 'Laundry',
      date: DateTime.now(),
    ),
  ];
  // List<Item> get items {
  //   return [..._items];
  // }
  void postData(String name, DateTime date) {
    final newItem = Item(id: DateTime.now().minute, title: name, date: date);
    if (name.isNotEmpty) {
      setState(() {
        _items.add(newItem);
      });
    } else {
      throw Exception('Title empty');
    }
  }

  void showBottomSheet(BuildContext c) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        elevation: 9,
        context: c,
        builder: (context) {
          return Column(children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: taskname,
                decoration: InputDecoration(
                    labelText: 'Enter Task',
                    labelStyle: TextStyle(color: Colors.lightGreenAccent[700]),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.lightGreenAccent.shade700,
                        )),
                    focusColor: Colors.blueGrey),
              ),
            ),
            Row(
              children: [
                Text(
                  'Due date: ',
                  style: TextStyle(color: Colors.lightGreenAccent[700]),
                ),
                TextButton(
                  child: Text(
                    _setDate == null
                        ? 'Date shows here.'
                        : DateFormat.yMMMd().format(_setDate!),
                    style: TextStyle(color: Colors.lightGreenAccent[700]),
                  ),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2027),
                    ).then((value) {
                      setState(() {
                        _setDate = value!;
                      });
                    });
                  },
                ),
              ],
            ),
            Center(
              child: OutlinedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.lightGreenAccent[700],
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  postData(taskname.text, _setDate!);
                },
              ),
            )
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    // final item = Provider.of<ItemProvider>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-do List'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          int count = index + 1;

          return ListItem(
            count: count,
            title: _items[index].title.toString(),
            date: _items[index].date,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(context);
        },
        child: const Icon(Icons.add_task),
      ),
    );
  }
}
