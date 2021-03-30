import 'package:flutter/material.dart';
import '../services/world_time.dart';

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //
  void setupWorld() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();

    print(instance.time);
  }

  @override
  void initState() {
    super.initState();
    setupWorld();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('Loading Sreen'),
      ),
    );
  }
}
