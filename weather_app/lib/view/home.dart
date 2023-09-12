import 'package:flutter/material.dart';
import 'package:weather_app/utils/progress_bar.dart';
import 'dart:async';
import 'dart:core';
import 'package:weather_app/controller/request.dart';
import 'package:weather_app/utils/tab_row.dart';
import 'package:weather_app/model/temperature.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double progress = 0;
  int elapse = 60;
  double progressStatus = 0;
  late Temperature? temp;
  List<String> msg = [
    "Nous téléchargeons les données…",
    "C'est presque fini…",
    "Plus que quelques secondes avant d'avoir le résultat…"
  ];
  List<String> cities = ['Rennes', 'Paris', 'Nantes', 'Bordeaux', 'Lyon'];
  int index = 0;
  int cityindex = 0;
  List<Temperature> tempTab = [];
  int booln = 0;

  @override
  void initState() {
    super.initState();
    _setProgress();
    _setMsg();
    _getData();
  }

  void _setProgress() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        progress = (1 - (elapse / 60));
        progressStatus = progress * 100;
        elapse -= 1;
      });
      if (elapse == -1) {
        timer.cancel();
      }
    });
  }

  void _setMsg() {
    Timer.periodic(const Duration(seconds: 6), (timer) {
      if (elapse > 0) {
        setState(() {
          if (index == msg.length - 1) {
            index = 0;
          }
          index += 1;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _getData() {
    Timer.periodic(const Duration(seconds: 10), (timer) async {
      if (elapse > 0 && cityindex < 5) {
        temp = (await RequestApi.getTemperature(cities[cityindex]));
        if (temp != null) {
          tempTab.add(temp!);
          cityindex += 1;
        }
      } else {
        timer.cancel();
      }
    });
  }

  void _reset() {
    setState(() {
      elapse = 60;
      tempTab = [];
      index = 0;
      booln = 0;
      cityindex = 0;
      progress = 0;
      progressStatus = 0;
      _setProgress();
      _setMsg();
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff4169E1),
                Color(0xff4682B4),
                Color(0xff00BFFF),
                Color(0xff87CEEB),
              ]),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "METEO",
                    style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: const Offset(10.0, 10.0),
                            blurRadius: 3.0,
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.1),
                          ),
                          Shadow(
                            offset: const Offset(10.0, 10.0),
                            blurRadius: 8.0,
                            color: const Color.fromARGB(125, 0, 0, 255)
                                .withOpacity(0.1),
                          ),
                        ],
                        color: Colors.white,
                        fontSize: 50,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                elapse < 0
                    ? const Text("Téléchargement terminé",
                        style: TextStyle(color: Colors.white))
                    : Text(msg.elementAt(index),
                        style: const TextStyle(color: Colors.white)),
                const SizedBox(
                  height: 20,
                ),
                elapse > 0 ? Container() : TabRow(tempTab: tempTab),
                elapse > 0
                    ? ProgressBar(
                        progress: progress, progressStatus: progressStatus)
                    : Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset: const Offset(0, 3),
                              )
                            ],
                            color: const Color(0xffDCDCDC),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextButton(
                            onPressed: _reset,
                            child: const Text('Recommencer',
                                style: TextStyle(color: Colors.black)))),
                elapse > 0
                    ? Container()
                    : const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Cliquez sur le bouton pour recharger les données",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
