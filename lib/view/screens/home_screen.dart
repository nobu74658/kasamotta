import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
              ),
              ElevatedButton(
                onPressed: () => _fireFunction(),
                child: Text("function"),
              ),
              ElevatedButton(onPressed: () => _cloudFunctionMethod(), child: Text('future'))
            ],
          ),
        ),
      ),
    );
  }

  _buttonPushed() async {
    print("_buttonPushed スタート");
    final response = await http.post(
    //   Uri.parse(
    //       "https://api.open-meteo.com/v1/forecast?latitude=34.49&longitude=135.40&current_weather=true"),
    // );
      Uri.parse(
          "https://us-central1-kasamotta.cloudfunctions.net/date"),
    );
    print(response.body);
    // http.Request(
    // );
    print("_buttonPushed 終了");
  }

  _getLocation() async {
    //TODO：android manifest location permissions
    String _location = "no data";
    LocationPermission permission = await Geolocator.checkPermission();
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

  _fireFunction() async {
    try {
      final result =
          await FirebaseFunctions.instance.httpsCallable("addMessage").call();
    } on FirebaseFunctionsException catch (error) {
      print(error.code);
      print(error.details);
      print(error.message);
    }
  }

  Future<void> _cloudFunctionMethod() async {
    print('cloudFunctionMethod スタート');
    HttpsCallable callable =
    FirebaseFunctions.instanceFor(region: "us-central1")
        .httpsCallable("date");
    var result = await callable.call();
    print(result.data);
    print('cloudFunctionMethod 終了');
  }
}
