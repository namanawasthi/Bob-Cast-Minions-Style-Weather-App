import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingbobstudios/Services/weather.dart';
import 'package:kingbobstudios/Utilities/Random.dart';
import 'package:kingbobstudios/Utilities/constants.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  num temperature;
  String weatherMessage;
  String weatherIcon;
  String cityName;

  @override
  // ignore: must_call_super
  void initState() {
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      num temp;

      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = "Unable to get location data";
        cityName = 'Your City';
        return;
      }
      temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherMessage = weather.getMessage(temperature);
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellowAccent,
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: orientation == Orientation.landscape
                  ? AssetImage('images/try.jpeg')
                  : AssetImage('images/back.jpeg'),
              fit: orientation == Orientation.landscape
                  ? BoxFit.contain
                  : BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(1.0), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: FloatingActionButton(
                            tooltip: 'get current location',
                            heroTag: 'location',
                            backgroundColor: Colors.blueAccent,
                            child: Icon(
                              Icons.near_me,
                              color: Colors.yellowAccent,
                              size: 45.0,
                            ),
                            onPressed: () async {
                              var weatherData =
                                  await weather.getLocationWeather();
                              updateUI(weatherData);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: FloatingActionButton(
                            heroTag: 'city',
                            tooltip: 'get city weather',
                            backgroundColor: Colors.blueAccent,
                            child: Icon(
                              Icons.search,
                              size: 50.0,
                              color: Colors.yellowAccent,
                            ),
                            onPressed: () async {
                              var typedName = await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return CityScreen();
                                }),
                              );
                              if (typedName != null) {
                                var weatherData =
                                    await weather.getCityWeather(typedName);
                                updateUI(weatherData);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    orientation == Orientation.portrait
                        ? Image(
                            image: AssetImage('images/8.jpg'),
                          )
                        : Text(''),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 25.0,
                          top: orientation == Orientation.landscape
                              ? 0.0
                              : 10.0),
                      child: Row(
                        children: <Widget>[
                          AutoSizeText(
                            '$temperature°',
                            style: kTempTextStyle,
                            maxLines: 1,
                            maxFontSize: 70,
                            minFontSize: 30,
                          ),
                          AutoSizeText(
                            weatherIcon,
                            style: kConditionTextStyle,
                            maxLines: 1,
                            maxFontSize: 70,
                            minFontSize: 50,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.height * 0.04
                          : MediaQuery.of(context).size.height * 0.2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 15.0,
                        left: 10.0,
                      ),
                      child: AutoSizeText(
                        "$weatherMessage in $cityName!",
                        textAlign: TextAlign.right,
                        style: kMessageTextStyle,
                        maxLines: 3,
                        maxFontSize: 50,
                        minFontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    orientation == Orientation.portrait
                        ? Image(
                            image: AssetImage(
                                'images/${randomNumberValues(1, 33)}.jpg'),
                          )
                        : Text(''),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
