import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'atasozleri_listesi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int random_sec = Random().nextInt(atasozleri.length);
  int maxIndex = atasozleri.length - 1;
  int minIndex = 0;

  void showNextAtasoz() {
    setState(() {
      if (random_sec < maxIndex) {
        random_sec++;
      } else {
        random_sec = minIndex;
      }
    });
  }

  void showPreviousAtasoz() {
    setState(() {
      if (random_sec > minIndex) {
        random_sec--;
      } else {
        random_sec = maxIndex;
      }
    });
  }

  void showRandomAtasoz() {
    setState(() {
      random_sec = Random().nextInt(atasozleri.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Tavsiye ver !!!",style: GoogleFonts.shadowsIntoLight(
                         fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold, ),)
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue, Colors.white],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      atasozleri[random_sec],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.shadowsIntoLight(
                        fontSize: 55.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(flex: 1,
                        child: ElevatedButton(
                          onPressed: showPreviousAtasoz,
                          child: Text(
                            "Geri",
                            style: GoogleFonts.caveat(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(flex:2 ,
                        child: ElevatedButton(
                          onPressed: showRandomAtasoz,
                          child: Text(
                            "Tavsiye Ver",
                            style: GoogleFonts.caveat(
                              fontSize: 35.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(flex: 1,
                        child: ElevatedButton(
                          onPressed: showNextAtasoz,
                          child: Text(
                            "Ileri",
                            style: GoogleFonts.caveat(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
