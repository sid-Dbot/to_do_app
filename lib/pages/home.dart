import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/items_Provider.dart';

import 'package:to_do_app/widgets/listItem.dart';

import '../models/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _setDate = DateTime.now();

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

  @override
  Widget build(BuildContext context) {
    //context.watch<ItemProvider>().watchAll();
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-do List'),
      ),
      body: Consumer<ItemProvider>(
        builder: (context, value, child) {
          return value.savedList.isEmpty
              ? ListView.builder(
                  itemCount: value.savedList.length,
                  itemBuilder: (context, index) {
                    int count = index + 1;

                    return ListItem(
                      count: count,
                      title: value.savedList[index].name.toString(),
                      // delete: value.delete(value.savedList[index]),
                      date: value.savedList[index].date.toString(),
                    );
                  },
                )
              : Center(
                  child: Text('No Tasks'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.black,
              elevation: 9,
              builder: (context) {
                return Consumer<ItemProvider>(builder: (context, value, child) {
                  return Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: taskname,
                        decoration: InputDecoration(
                            labelText: 'Enter Task',
                            labelStyle:
                                TextStyle(color: Colors.lightGreenAccent[700]),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                  color: Colors.lightGreenAccent.shade700,
                                )),
                            focusColor: Colors.blueGrey),
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Due date: ',
                    //       style: TextStyle(color: Colors.lightGreenAccent[700]),
                    //     ),
                    //     TextButton(
                    //       child: Text(
                    //         _setDate == null
                    //             ? 'Date shows here.'
                    //             : DateFormat.yMMMd().format(_setDate!),
                    //         style:
                    //             TextStyle(color: Colors.lightGreenAccent[700]),
                    //       ),
                    //       onPressed: () {
                    //         showDatePicker(
                    //           context: context,
                    //           initialDate: DateTime.now(),
                    //           firstDate: DateTime(2022),
                    //           lastDate: DateTime(2027),
                    //         ).then((value) {
                    //           _setDate = value!;
                    //           setState(() {});
                    //         });
                    //       },
                    //     ),
                    //   ],
                    // ),
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
                          value.addTask(taskname.text,
                              DateFormat.yMMMd().format(_setDate));
                          print(value.savedList.length);
                          setState(() {});
                        },
                      ),
                    )
                  ]);
                });
              }).whenComplete(() {
            setState(() {});
          });
        },
        child: const Icon(Icons.add_task),
      ),
    );
  }
}
