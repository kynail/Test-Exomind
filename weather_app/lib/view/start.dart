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
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "METEO",
            style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: const Offset(10.0, 10.0),
                    blurRadius: 3.0,
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                  ),
                  Shadow(
                    offset: const Offset(10.0, 10.0),
                    blurRadius: 8.0,
                    color:
                        const Color.fromARGB(125, 0, 0, 255).withOpacity(0.1),
                  ),
                ],
                color: Colors.white,
                fontSize: 50,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "BIENVENUE",
            style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: const Offset(10.0, 10.0),
                    blurRadius: 3.0,
                    color: Colors.black.withOpacity(0.1),
                  ),
                  Shadow(
                    offset: const Offset(10.0, 10.0),
                    blurRadius: 8.0,
                    color:
                        const Color.fromARGB(125, 0, 0, 255).withOpacity(0.1),
                  ),
                ],
                color: Colors.white,
                fontSize: 40,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
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
