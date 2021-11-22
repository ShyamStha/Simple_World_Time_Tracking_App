
import 'package:flutter/material.dart';

import 'main.dart';

class Country extends StatefulWidget {
  @override
  _ContryState createState() => _ContryState();
}

class _ContryState extends State<Country> {
  @override
  Widget build(BuildContext context) {
    var countries = [
       {
        'name': 'Nepal',
        'location': 'Asia/Kathmandu',
        'flag': 'images/nepal.jpg'
      },
      {
        'name': 'Germany',
        'location': 'Europe/Berlin',
        'flag': 'images/germany.jpg'
      },
      {
        'name': 'Ireland',
        'location': 'Europe/Dublin',
        'flag': 'images/ireland.jpg'
      },
      {'name': 'Japan', 'location': 'Asia/Tokyo', 'flag': 'images/japan.jpg'},
      {'name': 'Thailand', 'location': 'Asia/Bangkok', 'flag': 'images/thai.jpg'},
      {'name': 'Srilanka', 'location': 'Asia/Colombo', 'flag': 'images/srilanka.png'},
      {'name': 'Indonesia', 'location': 'Asia/Jakarta', 'flag': 'images/indonesia.jpg'},
      {'name': 'Quatar', 'location': 'Asia/Qatar', 'flag': 'images/quatar.jpg'},
      {'name': 'Singapore', 'location': 'Asia/Singapore', 'flag': 'images/singapore.jpg'},
      {'name': 'Belgium', 'location': 'Europe/Brussels', 'flag': 'images/belgium.jpg'},
      {'name': 'Russia', 'location': 'Europe/Moscow', 'flag': 'images/russia.jpg'},
      {'name': 'Norway', 'location': 'Europe/Oslo', 'flag': 'images/norway.jpg'},
      {'name': 'Poland', 'location': 'Europe/Warsaw', 'flag': 'images/poland.jpg'},
      {'name': 'France', 'location': 'Europe/Paris', 'flag': 'images/france.jpg'},
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('World Time'),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        body: ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  print('I am pressed');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(
                                homeLocation: countries[index]['location'],
                                homeImage: countries[index]['flag'],
                                homeCountry: countries[index]['name'],
                              )));
                },
                child: Card(
                    //child: Text(countries[index]['location']),
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        countries[index]['flag'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                        child: Text(
                      countries[index]['name'],
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    )),
                  ],
                )),
              );
            }),
      ),
    );
  }
}