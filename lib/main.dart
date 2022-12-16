import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/pages/home.dart';
import 'package:to_do_app/provider/items_Provider.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ItemProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.blueGrey[900],
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepOrange,
              accentColor: Colors.limeAccent[700],
            ),
            textTheme: TextTheme(
                headline6: GoogleFonts.emilysCandy(
                  fontSize: 27,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                bodyText2: GoogleFonts.emilysCandy(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
                subtitle1: GoogleFonts.federant(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                subtitle2: GoogleFonts.federant(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.deepOrange,
                ))),
        darkTheme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}
