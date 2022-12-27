import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:to_do_app/models/item.dart';
import 'package:to_do_app/provider/items_Provider.dart';

class ListItem extends StatelessWidget {
  int count;
  String title;
  DateTime date;
  ListItem({required this.count, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.limeAccent[700],
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(
                2.0,
                4.0,
              ), //Offset
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            //BoxShadow
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: ListTile(
          title: Text(
            title,
          ),
          leading: Text(
            '${count}.',
          ),
          subtitle: Text(
            'Date Added: ${DateFormat.yMMMd().format(date)}',
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
