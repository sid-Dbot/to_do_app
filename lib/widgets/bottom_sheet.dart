import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BottomSheetContents extends StatefulWidget {
  const BottomSheetContents({super.key});

  @override
  State<BottomSheetContents> createState() => _BottomSheetContentsState();
}

class _BottomSheetContentsState extends State<BottomSheetContents> {
  DateTime? setDate;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(11.0),
        child: TextField(
          decoration: InputDecoration(
              labelText: 'Enter Task',
              labelStyle:
                  GoogleFonts.frijole(color: Colors.lightGreenAccent[700]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              focusColor: Colors.blueGrey),
        ),
      ),
      Row(
        children: [
          const Text('Due date: '),
          TextButton(
            child: Text(
              setDate == null
                  ? 'Date shows here.'
                  : DateFormat.yMMMd().format(setDate!),
              style: GoogleFonts.frijole(color: Colors.lightGreenAccent[700]),
            ),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime(2027),
              ).then((value) {
                setState(() {
                  setDate = value;
                });
              });
            },
          ),
        ],
      ),
    ]);
  }
}
