import 'package:flutter/material.dart';
import 'dart:ui';
import 'hourly_forcast_item.dart';
import 'additional_info.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh_rounded))
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
                            '300.06K',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          SizedBox(
                            height: 15,
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
                    icon: Icons.wind_power_sharp,
                    label: "Wind Speed",
                    value: "19.8"),
                AdditionalInfo(
                    icon: Icons.roofing_sharp,
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
