import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> getCountry() async {
  try {
    var client = http.Client();
    http.Response response = await client.get(
      Uri.parse('https://restcountries.com/v3.1/all'),
    );
    var jsonResponse = json.decode(utf8.decode((response.bodyBytes)));
    var list = [];
    jsonResponse.forEach((element) {
      list.add(ACountry(
        name: element['name']['common'],
        official: element['name']['official'],
        region: element['region'],
        flag: element['flags']['png'],
        population: element['population'],
        capi: element['capital'],
        // continent: element['alpha2Code'],
      ));
      // ;
    });
    // print(list);
    return list;
  } catch (e) {
    // print(e);
  }
}

class ACountry {
  String name;
  String flag;
  String region;
  var capi;
  String official;
  int population;
  // String url;

  ACountry({
    required this.name,
    required this.flag,
    required this.region,
    required this.capi,
    required this.population,
    required this.official,
    // required this.continent,
    // required this.url
  });
}
