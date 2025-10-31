import 'package:bloopa/utils/Responsive.dart';
import 'package:flutter/material.dart';

import '../widgets/appBar/AppBarLayout.dart';
import '../widgets/bottomBar/BottomBarLayout.dart';
import '../widgets/card-product/CarListingCard.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required String categorie, required String typeproduit});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // ✅ On génère 40 véhicules automatiquement
  final List<Map<String, dynamic>> cars = List.generate(40, (i) {
    final randomImages = [
      "https://picsum.photos/800/600?car$i",
      "https://picsum.photos/800/601?car$i",
      "https://picsum.photos/801/600?car$i",
      "https://picsum.photos/802/600?car$i",
    ];

    final models = [
      "Audi Q5",
      "BMW X1",
      "Mercedes GLC",
      "Tesla Model Y",
      "Volkswagen Tiguan",
      "Peugeot 3008",
      "Renault Arkana",
      "Nissan Qashqai",
      "Ford Kuga",
    ];

    final engines = ["Diesel", "Essence", "Hybride", "Électrique"];
    final transmissions = ["Automatique", "Manuelle"];
    final cities = [
      "Paris 75015",
      "Lyon 69003",
      "Montpellier 34070",
      "Marseille 13008",
      "Toulouse 31000",
      "Bordeaux 33000",
      "Nice 06000",
      "Lille 59000",
      "Rennes 35000",
    ];

    final model = models[i % models.length];
    final engine = engines[i % engines.length];
    final trans = transmissions[i % transmissions.length];
    final city = cities[i % cities.length];

    final year = 2016 + (i % 8);
    final km = (20000 + (i * 1300)).toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => "${m[1]} ",
    );

    final price = (19900 + i * 600).toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => "${m[1]} ",
    );

    return {
      "imageUrl": randomImages[i % randomImages.length],
      "title": "$model $engine",
      "price": "$price €",
      "year": "$year",
      "mileage": "$km km",
      "powertrain": engine,
      "transmission": trans,
      "location": city,
    };
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBarLayout(scaffoldKey: _scaffoldKey),
      bottomNavigationBar: BottomBarLayout(
        itemSelected: 0,
        local: 'de',
        listName: 'ddd',
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          const itemWidth = 300.0;
          int crossAxisCount = (constraints.maxWidth / itemWidth).floor();

          // ✅ si écran petit → 1 carte par ligne
          if (crossAxisCount < 1) crossAxisCount = 1;

          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.72,
            ),
            itemCount: cars.length,
            itemBuilder: (context, index) {
              final car = cars[index];
              return CarListingCard(
                imageUrl: car["imageUrl"],
                title: car["title"],
                priceLabel: car["price"],
                year: car["year"],
                mileageLabel: car["mileage"],
                powertrain: car["powertrain"],
                transmission: car["transmission"],
                location: car["location"],
              );
            },
          );
        },
      ),
    );
  }
}
