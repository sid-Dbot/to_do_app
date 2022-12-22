import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:to_do_app/widgets/bottom_sheet.dart';
import 'package:to_do_app/widgets/listItem.dart';

import '../provider/items_Provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? setDate;
  TextEditingController? taskname;
  @override
  Widget build(BuildContext context) {
    final d = context.read<ItemProvider>().postData(
        taskname.toString(), DateFormat.yMMMd().format(setDate!).toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-do List'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          int count = index;

          return ListItem(
            count: count,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.black,
            elevation: 9,
            context: context,
            builder: (context) {
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
                Row(
                  children: [
                    Text(
                      'Due date: ',
                      style: TextStyle(color: Colors.lightGreenAccent[700]),
                    ),
                    TextButton(
                      child: Text(
                        setDate == null
                            ? 'Date shows here.'
                            : DateFormat.yMMMd().format(setDate!),
                        style: TextStyle(color: Colors.lightGreenAccent[700]),
                      ),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2027),
                        ).then((value) {
                          d;
                          setState(() {
                            setDate = value;
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
                      setState(() {});
                    },
                  ),
                )
              ]);
              ;
            },
          );
        },
        child: const Icon(Icons.add_task),
      ),
    );
  }
}
