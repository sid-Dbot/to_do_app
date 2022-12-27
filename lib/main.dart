import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/database/DAO.dart';
import 'package:to_do_app/database/database.dart';

import 'package:to_do_app/pages/home.dart';
import 'package:to_do_app/provider/items_Provider.dart';
import 'package:to_do_app/repo/save_repo.dart';

void main() {
  GetIt getIt = GetIt.instance;

  getIt.registerSingletonAsync<AppDatabase>(
      () async => $FloorAppDatabase.databaseBuilder('task.db').build());
  getIt.registerSingletonWithDependencies(() {
    return GetIt.instance.get<AppDatabase>().itemDAO;
  }, dependsOn: [AppDatabase]);
  getIt.registerSingletonWithDependencies<SaveRepo>(() {
    return SaveRepo();
  }, dependsOn: [AppDatabase, ItemDAO]);

  runApp(MainApp());
}

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
              button: GoogleFonts.federant(
                fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
              headline6: GoogleFonts.emilysCandy(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              bodyText1: GoogleFonts.emilysCandy(
                fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
              bodyText2: GoogleFonts.federant(
                fontStyle: FontStyle.italic,
                fontSize: 20,
              ),
              subtitle1: GoogleFonts.federant(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            )),
        darkTheme: ThemeData.dark(),
        home: FutureBuilder(
          future: GetIt.instance.allReady(),
          builder: (context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? HomePage()
                : Scaffold(
                    body: Center(
                      child: Text('noData'),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
