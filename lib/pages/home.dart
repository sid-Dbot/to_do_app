import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/widgets/bottom_sheet.dart';
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
              return BottomSheetContents();
            },
          );
        },
        child: Icon(Icons.add_task),
      ),
    );
  }
}