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
  @override
  void initState() {
    super.initState();
    getAPI();
  }

  Future<void> getAPI() async {
    final Uri uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=dd169bc21a42fb3c3bfbdb12a9ec0717");
    final res = await http.get(uri);
    print(res.body);
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
            onTap: () {},
            child: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
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
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '300.06 K',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            'Rain',
                            style: TextStyle(
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
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForcastItem(
                      time: "10:00",
                      weatherConditionIcon: Icons.cloud,
                      weatherConditionTemperature: "245.7K"),
                  HourlyForcastItem(
                      time: "11:00",
                      weatherConditionIcon: Icons.cloudy_snowing,
                      weatherConditionTemperature: "397.8K"),
                  HourlyForcastItem(
                      time: "12:00",
                      weatherConditionIcon: Icons.sunny,
                      weatherConditionTemperature: "365K"),
                  HourlyForcastItem(
                      time: "13:00",
                      weatherConditionIcon: Icons.sunny,
                      weatherConditionTemperature: "345.8K"),
                  HourlyForcastItem(
                      time: "14:00",
                      weatherConditionIcon: Icons.cloud,
                      weatherConditionTemperature: "294.87K"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Additional Information",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AdditionalInfo(
                    icon: Icons.water_drop_outlined,
                    label: "Humdity",
                    value: "91"),
                AdditionalInfo(
                    icon: Icons.air, label: "Wind Speed", value: "19.8"),
                AdditionalInfo(
                    icon: Icons.beach_access_sharp,
                    label: "Pressure",
                    value: "1006"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
