import 'package:flutter/material.dart';
import 'package:taller_flutter/models/models.dart';
import 'package:taller_flutter/services/nasa_service.dart';
import 'package:taller_flutter/widgets/asteroid_card.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  NasaService nasaService = NasaService();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("TExto 1"),
          Expanded(
            child: FutureBuilder(
              future: nasaService.getAsteroids(startDate, endDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                var data = snapshot.data as List<Asteroid>?;

                if (data == null) return Text("Error");

                return ListView.builder(
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  itemBuilder: (context, index) {
                    var currentObject = data[index];

                    return AsteroidCard(asteroid: currentObject);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
