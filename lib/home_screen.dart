import 'package:flutter/material.dart';
import 'package:get_location/service/location_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location"),),
      body: FutureBuilder(
        future: LocationService.locationService(),
        builder: (context, snap) {

          if(snap.connectionState == ConnectionState.done){
            return  Center(child: Text(snap.data.toString()),);
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }

        }
      ),
    );
  }
}
