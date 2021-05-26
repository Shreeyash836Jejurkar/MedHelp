import 'package:http/http.dart' as http;
import 'dart:convert';

import 'globalSummary.dart';

class CovidService {
  Future<GlobalSummaryModel> getGlobalSummary() async {
    final data = await http.Client()
        .get(Uri.parse("https://api.covid19api.com/summary"));

    if (data.statusCode != 200) throw Exception();

    GlobalSummaryModel summary =
        new GlobalSummaryModel.fromJson(json.decode(data.body));

    return summary;
  }
}
