import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/global.params.dart';


class MyDrawer extends StatelessWidget {
  late SharedPreferences prefs;
  static List<Map<String,dynamic>>accueil=[
  {"image":AssetImage('images/meteo.jpg',),"route":"/meteo"},
{"image":AssetImage('images/galerie.jpg',),"route":"/gallery"},

{"image":AssetImage('images/parametre.jpg',),"route":"/parametres"},

{"image":AssetImage('images/déconnexion.jpg',),"route":"/authentification"},
];


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.white, Colors.blue]),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/iset.jpg"),
                radius: 80,
              ),
            ),
          ),
          ListTile(
            title: Text('Home', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            title: Text('Meteo', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.cloud),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/meteo');
            },
          ),
          ListTile(
            title: Text('Gallery', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.image),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/gallery');
            },
          ),
          ListTile(
            title: Text('pays', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.location_city),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/PaysPage');
            },
          ),
          ListTile(
            title: Text('Paramétres', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/parametres');
            },
          ),

          ListTile(
            title: Text('Déconnexion', style: TextStyle(fontSize: 22)),
            leading: Icon(Icons.logout),
            trailing: Icon(Icons.arrow_right, color: Colors.blue),
            onTap: () {
              _deconnexion(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _deconnexion(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/authentification', (Route<dynamic> route) => false);
  }
}
