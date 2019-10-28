import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

const apikey = 'f99e99050016c4b946829a11c44f591b';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  void getlocation() async {
    Location location = Location();
    location.getlocation();
    latitude = location.latitude;
    longitude = location.longitude;
    getData();
  }

  void printrandom(String hi) {
    print(hi);
  }

  void getData() async {
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey');
    print(response.body);

    if (response.statusCode == 200) {
      String data = response.body;

      var id = jsonDecode(data)['weather'][0]['id'];
      print(id);
      var temp = jsonDecode(data)['main']['temp'];
      print(temp);
      var city = jsonDecode(data)['name'];
      print(city);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getlocation();
    printrandom('aksnlakndaldn');

    return Scaffold();
  }
}
