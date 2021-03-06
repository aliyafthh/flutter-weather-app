import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '0961697229f2fb11167e54c4b3a76f4e';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherMapURL?q=$cityName&units=metric&appid=$apiKey';
    NetworkHelper network = new NetworkHelper(url);
    var weatherData = await network.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    // run a function in background while waiting for it to load
    Location x = new Location();
    await x.getCurrentLocation();

    NetworkHelper network = new NetworkHelper(
        '$openWeatherMapURL?lat=${x.latitude}&lon=${x.longitude}&units=metric&appid=$apiKey');

    var weatherData = await network.getData();

    return weatherData;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}