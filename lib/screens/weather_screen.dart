import 'dart:ui';

import 'package:climateapp/screens/city_search.dart';
import 'package:climateapp/services/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../custom_wid/weather_detail.dart';

class WeatherData extends StatefulWidget {
  WeatherData({this.locationweather});

  var locationweather;

  @override
  State<WeatherData> createState() => _WeatherDataState();
}

class _WeatherDataState extends State<WeatherData> {
  WeatherModel weatherModel = WeatherModel();

  var temperature;
  num? condition;
  var cityName;
  var weatherMessage;
  var weatherImage;
  var desc;
  var countryName;
  num? windSpeed;
  num? humidity;

  updateUI({dynamic weatherData}) {
    setState(() {
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      condition = weatherData['weather'][0]['id'];
      // condition.toString();
      weatherImage = weatherModel.getWeatherIcon(condition);
      cityName = weatherData['name'];
      desc = weatherData['weather'][0]['description'];
      countryName = weatherData['sys']['country'];
      windSpeed = weatherData['wind']['speed'];
      humidity = weatherData['main']['humidity'];
      // main.humidity
      // print(temperature)
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(weatherData: widget.locationweather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
            // constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                  "images/bg.jpg",
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.9), BlendMode.dstATop),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1,
                sigmaY: 1,
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                          child: IconButton(
                            onPressed: () {
                              updateUI(weatherData: widget.locationweather);
                            },
                            icon: const Icon(
                              Icons.near_me,
                              color: Color(0xFFF5FFFF),
                              size: 24,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          child: IconButton(
                            onPressed: () async {
                              var typedName = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CityScreen();
                                  },
                                ),
                              );

                              if (typedName != null) {
                                var weatherData =
                                    await weatherModel.getCity(typedName);
                                print(weatherData);
                                setState(() {
                                  updateUI(weatherData: weatherData);
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Color(0xFFF5FFFF),
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$temperature°",
                                      style: GoogleFonts.quicksand(
                                        fontSize: 100,
                                        color: Color(0xFFFFFBFF),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      height: 75,
                                      width: 75,
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            weatherImage!,
                                            color: Color(0xFFFFFBFF),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  desc!,
                                  style: GoogleFonts.quicksand(
                                    fontSize: 21,
                                    color: Color(0xFFFFFBFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      // Expanded(child: Column
                      Text("$cityName, $countryName",
                          style: GoogleFonts.quicksand(
                              color: const Color(0xFFFFFBFF), fontSize: 22)),
                      const SizedBox(
                        height: 3,
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                        color: Color(0xFFF6F4EB),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TestingWidget(
                                    url: "images/wind.png",
                                    text: " $windSpeed m/s",
                                  ),
                                  TestingWidget(
                                    url: "images/humidity.png",
                                    text: "$humidity%",
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
