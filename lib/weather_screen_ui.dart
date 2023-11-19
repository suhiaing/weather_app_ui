import 'dart:ui';

import 'package:flutter/material.dart';

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        //main column
        child: Column(
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
                        children: [
                          Text(
                            '300.06K',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          SizedBox(height: 16),
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
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            color: Colors.white70,
                            width: 50,
                            height: 100,
                          ),
                          Container(
                            color: Colors.white70,
                            width: 50,
                            height: 100,
                          ),
                          Container(
                            color: Colors.white70,
                            width: 50,
                            height: 100,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Placeholder(
              fallbackHeight: 100,
            )
          ],
        ),
      ),
    );
  }
}
