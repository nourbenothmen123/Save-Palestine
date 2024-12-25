import 'package:flutter/material.dart';



import 'pays_details.dart';

class PaysPage extends StatefulWidget {
  @override
  State<PaysPage> createState() => _PaysPageState();
}

class _PaysPageState extends State<PaysPage> {
  String city = '';
  TextEditingController txt_city = new TextEditingController();

  void _onGetPaysDetails(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PaysDetails(pays: city,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Page Meteo')),
        appBar: AppBar(
          title: Text('Page Pays'),
        ),

        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_city,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                    hintText: "tape a city",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10))),
                onChanged: (String str) {
                  setState(() {
                    city = str;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: () {
                    _onGetPaysDetails(context);
                  },
                  child: Text('Rechercher', style: TextStyle(fontSize: 22))),
            ),
          ],
        ));
  }
}