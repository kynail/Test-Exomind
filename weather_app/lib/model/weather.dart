class Weather {
  final String main;

  const Weather({
    required this.main,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      main: json['main']
    );
  }
}