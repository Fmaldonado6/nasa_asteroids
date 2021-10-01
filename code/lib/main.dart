import 'package:flutter/material.dart';
import 'package:taller_flutter/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          textTheme: TextTheme(
            headline6: Theme.of(context)
                .textTheme
                .headline6
                ?.apply(color: Colors.black),
          ),
        ),
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            textTheme: TextTheme(
              headline6: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.apply(color: Colors.white),
            ),
          ),
          scaffoldBackgroundColor: Color(0xFF202125),
          cardColor: Color(0xFF242529)),
      home: MainScreen(),
    );
  }
}
