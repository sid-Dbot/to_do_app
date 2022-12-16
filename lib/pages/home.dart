import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/widgets/listItem.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-do List'),
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
            backgroundColor: Color.fromARGB(255, 192, 225, 241),
            elevation: 9,
            context: context,
            builder: (context) {
              return Container(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Enter Task',
                          labelStyle: GoogleFonts.frijole(
                              color: Colors.lightGreenAccent[700]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                          focusColor: Colors.blueGrey),
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Date shows here.',
                      style: GoogleFonts.frijole(
                          color: Colors.lightGreenAccent[700]),
                    ),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2027),
                      ).then((value) {});
                    },
                  ),
                ]),
              );
            },
          );
        },
        child: Icon(Icons.add_task),
      ),
    );
  }
}
