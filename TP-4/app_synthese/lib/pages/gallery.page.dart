import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});


  @override
  State<GalleryPage> createState() => GalleryPageState();
}

class GalleryPageState extends State<GalleryPage> {
  static const _icons = [
    Icons.cabin,
    Icons.landscape,
    Icons.pets,
    Icons.mouse,
    Icons.forest,
    Icons.directions_car,
    Icons.track_changes,
    Icons.traffic_sharp,
    Icons.train,
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Gallery')),
        body:GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: _icons.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.amber,
              child: Center(child: Icon(_icons[index], size: 40, color: Colors.deepOrange)),
            );
          },),
      );
  }
}

