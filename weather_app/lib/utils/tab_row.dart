import 'package:flutter/material.dart';
import 'package:weather_app/model/temperature.dart';

class TabRow extends StatefulWidget {
  final List<Temperature> tempTab;
  const TabRow({
    Key? key,
    required this.tempTab,
  }) : super(key: key);

  @override
  State<TabRow> createState() => _TabRowState();
}

Image _setPicto(List main) {
  String city = "";

  main.map((e) => city = e).toList();
  print(city);
  switch (city) {
    case "Clear":
      return Image.asset("asset/soleil.png");
    case "Clouds":
      return Image.asset("asset/temps-nuageux.png");
    case "Rain":
      return Image.asset("asset/pluie.png");
    case "Snow":
      return Image.asset("asset/snow.png");
    case "Fog":
      return Image.asset("asset/brouillard.png");
    case "Drizzle":
      return Image.asset("asset/pluie");
  }
  
  return Image.asset("asset/tempete-de-sable.png");
}

String _setCityName(String cityName) {
  switch (cityName) {
    case "Arrondissement de Rennes":
      return "Rennes";
    case "Arrondissement de Nantes":
      return "Nantes";
    case "Arrondissement de Lyon":
      return "Lyon";
  }
  return cityName;
}

class _TabRowState extends State<TabRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
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
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
                label: Center(
              child: Text("Ville"),
            )),
            DataColumn(
                label: Center(
              child: Text("Temps"),
            )),
            DataColumn(
                label: Center(
              child: Text("Temperature"),
            )),
          ],
          rows: widget.tempTab
              .map(
                (e) => DataRow(cells: <DataCell>[
                  DataCell(Center(child: Text(_setCityName(e.name)))),
                  DataCell(Center(
                      child: _setPicto(e.weatherTab
                          .map(
                            (e) => e.main,
                          )
                          .toList()))),
                  DataCell(Center(
                      child: Text("${e.temp.roundToDouble().round()}°C")))
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
}
