
import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';
class WorldTime
{
  String location;
  String time;
  String url;
  
  WorldTime({this.location,this.time,this.url});

   Future<String> getData()async
  {
    Response response= await get('http://worldtimeapi.org/api/timezone/$url');
    //print(response.body);
    var data=json.decode(response.body);
      String dateTime=data['datetime'];
    print(dateTime);
    time=dateTime;
    
   // DateTime t=DateTime.parse(time);
    return time;
    //print(data['utc_offset']);
    
  
    
    // String offSet=data['utc_offset'].substring(1,3);
    // //converting into datetime object
     //DateTime now=DateTime.parse(dateTime);
    // now=now.add(Duration(hours: int.parse(offSet)));
    // print(now);



    
  }



}