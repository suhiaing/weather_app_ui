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
  // @override
  // void initState() {
  //   super.initState();
  //   //getAPI(); မထည့်တာပဲကောင်းတယ် ဘာလုပ်မှာတုန်း နှစ်ခါကြီးခေါ်ပြီးတော့
  // }
/*1.consturcture 
  2.initState
  3.fn called (async ဖြစ်တဲ့အတွက် အောက်ကဟာတွေ ဆက်ခေါ်သွားပြီး*/

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
            onTap: () {},
            child: const Icon(Icons.refresh),
          )
        ],
      ),
      body: FutureBuilder(
        future: getAPI(),
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
                                  fontSize: 28,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AdditionalInfo(
                        icon: Icons.water_drop_outlined,
                        label: "Humdity",
                        value: currentHumidity.toString()),
                    AdditionalInfo(
                        icon: Icons.air,
                        label: "Wind Speed",
                        value: currentWindSpeed.toString()),
                    AdditionalInfo(
                        icon: Icons.beach_access_sharp,
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
