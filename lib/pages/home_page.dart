import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _weatherInfo = "Press the button to fetch weather data!";
  bool _isLoading = false;

  Future<void> fetchWeather() async {
    setState(() {
      _isLoading = true;
      _weatherInfo = "Fetching weather data...";
    });

    final double latitude = 37.7749; // Example: San Francisco
    final double longitude = -122.4194;

    final Uri url = Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&hourly=temperature_2m');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final temperature = data['hourly']['temperature_2m'][0];
        final time = data['hourly']['time'][0];

        setState(() {
          _weatherInfo =
          "Temperature: $temperature°C\nTime: $time\nLocation: San Francisco";
        });
      } else {
        setState(() {
          _weatherInfo = "Failed to fetch weather data!";
        });
      }
    } catch (e) {
      setState(() {
        _weatherInfo = "Error occurred: $e";
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // You can redirect to login screen or show a message
              print("User signed out");
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _weatherInfo,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : fetchWeather,
                child: _isLoading
                    ? const CircularProgressIndicator(
                  color: Colors.white,
                )
                    : const Text("Fetch Weather"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
