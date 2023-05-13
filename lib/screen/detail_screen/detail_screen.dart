import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_apps/screen/home_screen/views/home_screen.dart';

import '../../models/restaurant_model.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantDetailScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100.0)),
                height: size.height * 0.3,
                width: double.infinity,
                child: Image.network(
                  restaurant.pictureId,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: size.height * 0.016),
              Text(
                restaurant.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.008),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.red, size: 16),
                  SizedBox(width: 8),
                  Text(restaurant.city),
                ],
              ),
              SizedBox(height: size.height * 0.008),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  SizedBox(width: 8),
                  Text(restaurant.rating.toString()),
                ],
              ),
              SizedBox(height: size.height * 0.016),
              Text(
                restaurant.description,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: size.height * 0.016),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: Text('Kembali'),
              ),
              SizedBox(height: size.height * 0.016),
            ],
          ),
        ),
      ]),
    );
  }
}
