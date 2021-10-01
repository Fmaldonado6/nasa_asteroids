import 'package:flutter/material.dart';
import 'package:taller_flutter/models/models.dart';
import 'package:taller_flutter/widgets/asteroid_info_tile.dart';

class AsteroidCard extends StatelessWidget {
  final Asteroid asteroid;

  const AsteroidCard({Key? key, required this.asteroid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      child: Card(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Nombre: ${asteroid.name}",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: asteroid.isPotentiallyHazardous
                        ? Colors.red.shade300
                        : Colors.green.shade300,
                  ),
                  child: Text(
                    asteroid.isPotentiallyHazardous
                        ? "Peligroso"
                        : "No peligroso",
                  ),
                ),
                AsteroidInfoTile(
                  title: "Fecha de acercamiento",
                  subtitle: asteroid
                      .closeApproachData.first.closeApproachDate.day
                      .toString(),
                ),
                AsteroidInfoTile(
                  title: "Distancia de la Tierra",
                  subtitle:
                      asteroid.closeApproachData.first.missDistance.kilometers,
                ),
                AsteroidInfoTile(
                  title: "Velocidad",
                  subtitle: asteroid.closeApproachData.first.relativeVelocity
                      .kilometersPerHour,
                ),
                AsteroidInfoTile(
                  title: "Diametro",
                  subtitle: asteroid
                      .estimatedDiameter.kilometers.estimatedDiameterMax.toString(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
