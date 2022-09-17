import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Permissions extends StatefulWidget {
  const Permissions({Key? key}) : super(key: key);

  @override
  State<Permissions> createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  bool _requested = false;
  bool _fetching = false;
  late NotificationSettings _settings;

  Future<void> requestPermissions() async {
    setState(() {
      _fetching = true;
    });

    final settings = await FirebaseMessaging.instance.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );

    setState(() {
      _requested = true;
      _fetching = false;
      _settings = settings;
    });
  }

  Widget row(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$title:', style:  const TextStyle(fontWeight: FontWeight.bold),),
          Text(value),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(_fetching) {
      return const CircularProgressIndicator();
    }

    if(!_fetching) {
      return ElevatedButton(
        onPressed: () => requestPermissions,
        child: const Text('Request Permissions'),
      );
    }

    return Column(
      children: [
        row('Authorization Status', _settings.authorizationStatus.toString()),
      ],
    );
  }
}
