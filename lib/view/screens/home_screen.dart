import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _buttonPushed(),
                child: Text("Button"),
              ),
              ElevatedButton(
                onPressed: () => _getLocation(),
                child: Text("Location"),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buttonPushed() async{
    final response = await http.get(
      Uri.parse("https://api.open-meteo.com/v1/forecast?latitude=34.49&longitude=135.40&current_weather=true"),);
    print(response.body);
  }

  _getLocation() async{
    String _location = "no data";LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    print("緯度: " + position.latitude.toString());
    print("経度: " + position.longitude.toString());
  }
}
