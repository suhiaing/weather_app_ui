import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 100,
            child: Column(
              children: [
                Icon(
                  Icons.water_drop_outlined,
                  size: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Humidity",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "94",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            width: 50,
          ),
          SizedBox(
            width: 100,
            child: Column(
              children: [
                Icon(
                  Icons.wind_power_sharp,
                  size: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Wind Speed",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "7.68",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            width: 50,
          ),
          SizedBox(
            width: 100,
            child: Column(
              children: [
                Icon(
                  Icons.roofing_sharp,
                  size: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Pressure",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "1006",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
