import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Future openDateRangeSelector() async {
    var dateRange = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(start: startDate, end: endDate),
      firstDate: DateTime(2016),
      lastDate: DateTime.now(),
    );

    if (dateRange == null) return;

    var difference = dateRange.start.difference(dateRange.end);

    if (difference.inDays.abs() > 7) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Ingrese un rango menor a 7 dias"),
      ));
      return;
    }

    setState(() {
      startDate = dateRange.start;
      endDate = dateRange.end;
    });
  }

  bool isDarkModeEnabled() {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              isDarkModeEnabled() ? Brightness.light : Brightness.dark,
        ),
        title: Text(
          "Asteroids",
          style: TextStyle(
            color: isDarkModeEnabled() ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.date_range),
            onPressed: openDateRangeSelector,
            color: isDarkModeEnabled() ? Colors.white : Colors.black,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width * .5,
              child: Image.asset("assets/earth.gif"),
            ),
          ),
          Expanded(
            flex: 2,
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
