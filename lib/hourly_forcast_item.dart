import 'package:flutter/material.dart';

class HourlyForcastItem extends StatelessWidget {
  const HourlyForcastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: const Column(
            children: [
              Text(
                "3:00",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.cloud,
                size: 45,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Rain",
                style: TextStyle(
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
