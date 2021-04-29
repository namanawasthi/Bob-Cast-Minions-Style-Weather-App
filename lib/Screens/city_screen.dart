import 'package:flutter/material.dart';
import 'package:kingbobstudios/Utilities/Random.dart';
import 'package:kingbobstudios/Utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/${randomNumberValues(32, 35)}.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: TextButton(
                      //padding: EdgeInsets.only(top: 25.0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 40.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 500.0,
                    height: 50.0,
                    child: TextField(
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                      decoration: kTextFieldInputDecoration,
                      onChanged: (value) {
                        cityName = value;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: orientation == Orientation.portrait
                      ? const EdgeInsets.only(left: 120.0, right: 100.0)
                      : const EdgeInsets.only(left: 300.0, right: 300.0),
                  child: ElevatedButton(
                    child: Text(
                      'Get Weather',
                      style: kButtonTextStyle,
                    ),
                    //padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                  ),
                ),
              ],
            ),
            maintainBottomViewPadding: true,
          ),
        ),
      ),
    );
  }
}
