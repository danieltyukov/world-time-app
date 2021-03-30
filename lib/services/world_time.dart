import 'dart:convert';
import 'package:http/http.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;

  WorldTime({this.location, this.time, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/$url'),
      );
      Map data = jsonDecode(response.body);
      //
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(
        Duration(
          hours: int.parse(offset),
        ),
      );

      //set time property
      time = now.toString();
    } on Exception catch (error) {
      print(error);
    }
  }
}


