import 'package:flutter/material.dart';

class MeteoData extends StatefulWidget {
  final String ville;

  const MeteoData({Key? key, required this.ville}) : super(key: key);

  @override
  _MeteoDataState createState() => _MeteoDataState();
}

class _MeteoDataState extends State<MeteoData> {
  late List<String> meteoList;

  @override
  void initState() {
    super.initState();
    getMeteoData(widget.ville);
  }

  void getMeteoData(String ville) {

    setState(() {
      meteoList = List.generate(5, (index) => 'Météo à $ville à ${DateTime.now().add(Duration(hours: index)).toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prévisions météo pour ${widget.ville}'),
      ),
      body: ListView.builder(
        itemCount: meteoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(meteoList[index]),

            ),
          );
        },
      ),
    );
  }
}
