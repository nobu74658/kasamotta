import 'package:http/http.dart' as http;

void getWeather() async {
  final response = await http.get(
      Uri.parse("https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&daily=temperature_2m,relativehumidity_2m,windspeed_10m,current_weather"),);
    print(response.body);
}