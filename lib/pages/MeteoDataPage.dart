import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MeteoDataPage extends StatefulWidget {
  final String city;
  MeteoDataPage(this.city);

  @override
  _MeteoDataPageState createState() => _MeteoDataPageState();
}

class _MeteoDataPageState extends State<MeteoDataPage> {
  var meteoData;

  @override
  void initState() {
    super.initState();
    getMeteoData(widget.city);
  }


  void getMeteoData(String city) async {
    String url ="https://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=c109c07bc4df77a88c923e6407aef864";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        this.meteoData = json.decode(response.body);
      });
    } else {
      print("Erreur de requête : ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Données Meteo de ${widget.city}'),
      ),
      body: meteoData == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: meteoData['list'].length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.transparent],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "images/${meteoData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(meteoData['list'][index]['dt'] * 1000000))}",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(meteoData['list'][index]['dt'] * 1000000))} | ${meteoData['list'][index]['weather'][0]['main']}",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${(meteoData['list'][index]['main']['temp'] - 273.15).round()} °C",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
