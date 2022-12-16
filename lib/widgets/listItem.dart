import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/item.dart';
import 'package:to_do_app/provider/items_Provider.dart';

class ListItem extends StatelessWidget {
  int count;
  ListItem({required this.count});

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<ItemProvider>(context).items;
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.limeAccent[700],
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: const Offset(
                2.0,
                4.0,
              ), //Offset
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            //BoxShadow
          ],
        ),
        padding: EdgeInsets.all(8),
        child: ListTile(
          title: Text(
            item[count].title,
          ),
          leading: Text(
            '${item[count].id}.',
          ),
          subtitle: Text(
            'Status',
            style: GoogleFonts.farsan(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}