import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../models/restaurant_model.dart';
import '../../../services/services.dart';
import '../../detail_screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<String> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchJsonData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<String>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = json.decode(snapshot.data!);
            final restaurants = RestaurantModel.fromJson(data).restaurants;
            return ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Daftar Restoran',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rekomendasi Restoran untuk kamu!',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.016),
                for (int i = 0; i < restaurants.length; i++)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestaurantDetailScreen(
                              restaurant: restaurants[i]),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.120,
                                width: size.width * 0.350,
                                child: Image.network(
                                  restaurants[i].pictureId,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: size.height * 0.016),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(restaurants[i].name,
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: size.height * 0.008),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on,
                                              color: Colors.red, size: 16),
                                          SizedBox(width: 8),
                                          Text(restaurants[i].city)
                                        ],
                                      ),
                                      SizedBox(height: size.height * 0.008),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.orange, size: 16),
                                          SizedBox(width: 8),
                                          Text(restaurants[i].rating.toString())
                                        ],
                                      ),
                                    ]),
                              )
                            ],
                          ),
                          SizedBox(height: size.height * 0.016),
                        ],
                      ),
                    ),
                  )
              ],
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
