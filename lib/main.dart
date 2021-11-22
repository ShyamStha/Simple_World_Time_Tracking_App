import 'package:flutter/material.dart';

import 'countrys.dart';
import 'services/worldtime.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: Home(),
    initialRoute: '/',
    routes: {
      '/': (context) => Country(),
      '/home': (context) => Home(),
    },
  ));
}

class Home extends StatefulWidget {
  String homeLocation;
  String homeImage;
  String homeCountry;
  Home({this.homeLocation, this.homeImage, this.homeCountry});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String time;

  void showWorldTime() async {
    time = 'Its coming man just wait';
    WorldTime currentTime =
        WorldTime(location: 'Berlin', url: '${widget.homeLocation}');
    await currentTime.getData();
    setState(() {
      time = currentTime.time;
      print(time);
    });
  }

  @override
  void initState() {
    super.initState();
    showWorldTime();
  }
  
  bool showDayTime=false;
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                  '${widget.homeImage}',
                )),
              ),
            ),
            //Text(time.substring(12,13)),
            SizedBox(height: 25.0),
            Text(
              widget.homeCountry,
              style: TextStyle(fontSize: 80.0),
            ),
            SizedBox(height: 10.0),

            Text(
              time.substring(
                11,
                time.length - 13,
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

