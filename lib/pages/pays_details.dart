import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaysDetails extends StatefulWidget {
  final String pays;

  PaysDetails({required this.pays});

  @override
  _PaysDetailsState createState() => _PaysDetailsState();
}

class _PaysDetailsState extends State<PaysDetails> {
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    getPaysData(widget.pays);
  }

  void getPaysData(String pays) async {
    String url = 'https://restcountries.com/v2/name/tunisia';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      setState(() {
        data = jsonResponse[0];
      });

      print(data);
    } else {
      throw Exception('Failed to load data');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Pays Détails du ${widget.pays}'),
      ),
      body: Center(
        child: data != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              data!['flags']["png"],
              width: 100,
              height: 100,
            ),
            Text('${data!['translations']['fr']}'),
            Text('${data!['translations']['ar']}'),
            Text(
              'Administration',
              style: TextStyle(color: Colors.blue),
            ),
            Text('Capitale: ${data!['pays']}'),
            Text('languages(s): ${data!['languages'][0]['name']}'),
            Text(
              'Géographie',
              style: TextStyle(color: Colors.blue),
            ),
            Text('Région: ${data!['region']}'),
            Text('Superficie: ${data!['area']}'),
            Text('Fuseau Horaire: ${data!['timezones'][0]}'),
            Text(
              'Démographie',
              style: TextStyle(color: Colors.blue),
            ),
            Text('Population: ${data!['population']}'),
          ],
        )
            : CircularProgressIndicator(),
      ),
    );
  }

}
