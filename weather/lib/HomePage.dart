import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool gps;

  var weatherData;

  String url = "http://api.openweathermap.org/data/2.5/weather?";
  String lat = "";
  String lon = "";
  String appid = "appid=39b21a1bb381628bfa14045db5d8ea84&";
  String units = "units=metric";

  var background = Color(0xFFB1D1CF);
  String image = "images/cold_mountain.png";

  void permission() async {
    await Geolocator.requestPermission();
    var value = await Geolocator.checkPermission();
    setState(() {
      if (value == LocationPermission.always ||
          value == LocationPermission.whileInUse)
        gps = true;
      else
        gps = false;
    });
  }

  Future getData() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    lat = "lat=" + position.latitude.toString() + '&';
    lon = "lon=" + position.longitude.toString() + '&';

    http.Response response = await http.get(
      Uri.encodeFull(url + lat + lon + appid + units),
      headers: {"Accept": "application/json"},
    );
    print("Response body: ${response.body}");
    weatherData = jsonDecode(response.body);

    if (weatherData['main']['temp'] < 22) {
      background = Color(0xFFB1D1CF);
      image = "images/cold_mountain.png";
      print('cold');
    } else {
      background = Color(0xFFF5CE88);
      image = "images/hot_mountain.png";
      print('hot');
    }
    return weatherData;
  }

  Future<Null> _onRefresh() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    permission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Row(
                children: [
                  Text(
                    'Weather Apps',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.share, color: Colors.black),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'https://reasley.com/wp-content/uploads/2020/02/%EB%B0%B0%EA%B2%BD.png'))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Yoonsang',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'yunsang08@naver.com',
                    style: TextStyle(color: Colors.black),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),
                    Spacer(),
                    Text('Weather Apps'),
                    Spacer(),
                    gps == true
                        ? IconButton(
                            icon: Icon(Icons.gps_fixed),
                            onPressed: () {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text("위치 정보를 정상적으로 받아오고 있습니다."),
                              ));
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.gps_not_fixed),
                            onPressed: () {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text("위치 정보를 정상적이지 않습니다."),
                              ));
                            },
                          )
                  ],
                ),
                FutureBuilder(
                  future: getData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    return Container(
                      color: background,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "${snapshot.data['weather'][0]['main']}",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 16,
                              ),
                              Text(
                                '${snapshot.data['name']}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${snapshot.data['main']['temp'].toStringAsFixed(0)}",
                                style: TextStyle(
                                    fontSize: 65,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "℃",
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.keyboard_arrow_up,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      Text(
                                        "${snapshot.data['main']['temp_max'].toStringAsFixed(0)}℃",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      Text(
                                        "${snapshot.data['main']['temp_min'].toStringAsFixed(0)}℃",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),

                          // step4
                          Image.network('http://openweathermap.org/img/wn/' +
                              weatherData['weather'][0]['icon'] +
                              '@2x.png'),
                          Image.asset(
                            image,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("");
        },
      ),
    );
  }
}