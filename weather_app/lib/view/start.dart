import 'package:flutter/material.dart';
import 'package:weather_app/view/home.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "METEO",
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontStyle: FontStyle.italic),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "BIENVENUE",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontStyle: FontStyle.italic),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFF4682B4),
                borderRadius: BorderRadius.circular(15)),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text("Cliquez ici",
                    style: TextStyle(color: Colors.white))),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Cliquez sur le bouton pour continuer",
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ],
    );
  }
}
