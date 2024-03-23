import 'package:flutter/material.dart';

class HourlyForcastItem extends StatelessWidget {
  final String? time;
  final IconData? weatherConditionIcon;
  final String? weatherConditionTemperature;
  final String? todayDate;

  const HourlyForcastItem({
    super.key,
    required this.todayDate,
    required this.time,
    required this.weatherConditionIcon,
    required this.weatherConditionTemperature,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: 120,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text(
                todayDate!,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                time!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Icon(
                weatherConditionIcon,
                size: 45,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                weatherConditionTemperature!,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
