import 'package:climateapp/services/location.dart';
import 'package:climateapp/services/networking.dart';

import '../consts.dart';

class WeatherModel {
  Location loc = Location();

  Future gettingWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    NetworkHelper network = NetworkHelper(
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=${loc.lattitude}&lon=${loc.longtitude}&appid=$apiKey&units=metric");
    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather({cityname}) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            "https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey&units=metric");

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCity(cityName) async {
    // String cityName = 'Singapore';
    NetworkHelper networkHelperLoc = NetworkHelper(
        url:
            "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric");
    var locData = await networkHelperLoc.getData();

    return locData;

    // print(weatherData[0]['lat']);
  }

  getWeatherIcon(num? condition) {
    if (condition! < 300) {
      return 'images/thunderstorm.png';
    } else if (condition < 400) {
      return 'images/rainy.png';
    } else if (condition < 600) {
      return 'images/rainy.png';
    } else if (condition < 700) {
      return 'images/snowman.png';
    } else if (condition < 800) {
      return 'images/haze.png';
    } else if (condition == 800) {
      return 'images/half-sun.png';
    } else if (condition <= 804) {
      return 'images/cloud.png';
    } else {
      return '🤷‍';
    }
  }
}
