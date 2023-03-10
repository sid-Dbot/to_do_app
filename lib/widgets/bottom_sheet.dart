import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/pages/home.dart';
import 'package:to_do_app/provider/items_Provider.dart';

class BottomSheetContents extends StatelessWidget {
  DateTime? setDate;

  TextEditingController taskname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final d = context.read<ItemProvider>();
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
                setDate = value;
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
          onPressed: () {},
        ),
      )
    ]);
  }
}
