import 'package:dio/dio.dart';
import 'package:taller_flutter/models/models.dart';

class NasaService {
  Dio dio = Dio();

  String apiKey = "C4LLpCfV97OFzdb1EpRRnPo3fMCJ4a4gaIafvCRC";

  Future<List<Asteroid>> getAsteroids(DateTime startDate, DateTime endDate) async {
    String startDateFormatted = formatDate(startDate);
    String endDateFormatted = formatDate(endDate);

    Response response = await dio.get(
        "https://api.nasa.gov/neo/rest/v1/feed?start_date=$startDateFormatted&end_date=$endDateFormatted&api_key=$apiKey");

    List<Asteroid> asteroids = [];

    NeoResponse data = NeoResponse.fromJson(response.data);

    data.nearEarthObjects.forEach((key, value) {
      asteroids.addAll(value);
    });

    return asteroids;
  }

  String formatDate(DateTime time) {
    String month = time.month > 10 ? time.month.toString() : "0${time.month}";
    String day = time.day > 10 ? time.day.toString() : "0${time.day}";
    return "${time.year}-$month-$day";
  }
}
