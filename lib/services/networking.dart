import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper{

  NetworkHelper(this.url);

  final String url;

  Future getData() async{
      try {
        Uri parsedUrl = Uri.parse(url);
        http.Response response = await http.get(parsedUrl);

        if (response.statusCode == 200) {
          String data = response.body;

          var decodeData = jsonDecode(data);
          return decodeData;
        } else {
          print('Failed to fetch weather data. Status Code: ${response.statusCode}');
        }
      } catch (e) {
        print('Error fetching weather data: $e');
      }
    }
  }