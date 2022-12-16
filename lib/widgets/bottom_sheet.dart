import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetContents extends StatelessWidget {
  const BottomSheetContents({super.key});

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
      TextButton(
        child: Text(
          'Date shows here.',
          style: GoogleFonts.frijole(color: Colors.lightGreenAccent[700]),
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
    ]);
    ;
  }
}
