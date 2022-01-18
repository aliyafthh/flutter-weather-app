import 'package:geolocator/geolocator.dart';

class Location{

  double latitude = 0.0;
  double longitude = 0.0;

  Future<void> getCurrentLocation() async{ // run a function in background while waiting for it to load
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);//more accurate = more battery consumption
      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
    }catch(e){
      print(e);
    }

  }

}
