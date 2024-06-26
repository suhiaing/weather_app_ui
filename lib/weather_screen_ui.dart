import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'hourly_forcast_item.dart';
import 'additional_info.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;
  @override
  void initState() {
    super.initState();
    weather = getAPI();
  }

  Future<Map<String, dynamic>> getAPI() async {
    try {
      final Uri uri = Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=Tachileik,mm&APPID=dd169bc21a42fb3c3bfbdb12a9ec0717");
      final res = await http.get(uri);
      final data = jsonDecode(res.body);

      if (data["cod"] != "200") {
        throw "Unexpected error occured!";
      } else {
        return data;
      }
    } catch (e) {
      throw "Sorry...An unexpected error occured!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                weather = getAPI();
              });
            },
            child: const Icon(Icons.refresh),
          )
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final Map<String, dynamic> data = snapshot.data!;
          final currentWeatherData = data['list'][0];
          final double currentTemp = currentWeatherData['main']['temp'];
          final String currentWeatherCondition =
              currentWeatherData['weather'][0]['main'];
          final double currentPressure = currentWeatherData['main']['pressure'];
          final double currentWindSpeed = currentWeatherData['wind']['speed'];
          final double currentHumidity = currentWeatherData['main']['humidity'];

          return Padding(
            padding: const EdgeInsets.fromLTRB(100, 20, 100, 0),
            //main column
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  //wrap with sizebox coz we want to give it width
                  width: double.infinity,
                  child: Card(
                    //we want elevation
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      //it only give border to shadow
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      //we want border radius when we use BackdroopFilter it eat our border radius

                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        //what effect 3D shape
                        //blur the bg
                        filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 10,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "$currentTemp K",
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Icon(
                                currentWeatherCondition == 'Clouds' ||
                                        currentWeatherCondition == 'Rain'
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 64,
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Text(
                                currentWeatherCondition,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Weather Forecast",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> common =
                            data['list'][index + 1];
                        final String hourRaw = common['dt_txt'];
                        final String hour = hourRaw.substring(11, 16);
                        final String todayDate = hourRaw.substring(0, 10);
                        final String hourlyTemp =
                            common['main']['temp'].toString();
                        final String hourlyWeatherCondition =
                            common['weather'][0]['main'];
                        return HourlyForcastItem(
                            todayDate: todayDate,
                            time: hour,
                            weatherConditionIcon:
                                hourlyWeatherCondition == 'Clouds' ||
                                        hourlyWeatherCondition == 'Rain'
                                    ? Icons.cloud
                                    : Icons.sunny,
                            weatherConditionTemperature: hourlyTemp);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Additional Information",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AdditionalInfo(
                        icon: Icons.water_drop,
                        label: "Humdity",
                        value: currentHumidity.toString()),
                    AdditionalInfo(
                        icon: Icons.air,
                        label: "Wind Speed",
                        value: currentWindSpeed.toString()),
                    AdditionalInfo(
                        icon: Icons.beach_access,
                        label: "Pressure",
                        value: currentPressure.toString()),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
