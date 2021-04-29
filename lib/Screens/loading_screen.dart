import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kingbobstudios/Services/weather.dart';
import 'package:kingbobstudios/Utilities/constants.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // ignore: must_call_super
  void initState() {
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  updateScreen() {
    setState(() {
      getLocationData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SpinKitCubeGrid(
              color: Colors.blue,
              size: 100.0,
            ),
            SizedBox(height: 20.0, width: 20.0),
            FloatingActionButton(
              backgroundColor: Colors.blueAccent,
              onPressed: updateScreen,
              child: Text(
                'Go',
                style: KGoButtonTextStyle,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
