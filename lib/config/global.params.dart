import 'package:flutter/material.dart';
class GlobalParams {
  static List<Map<String, dynamic>>menus = [

    {
      "title": "Accueil",
      "icon": Icon(Icons.home, color: Colors.blue,),
      "route": "/home"
    },
    {"title": "Météo", "icon": Icon(Icons.sunny_snowing, color: Colors.blue,),
      "route": "/meteo"},
    {"title": "Gallerie", "icon": Icon(Icons.photo, color: Colors.blue,),
      "route": "/gallerie"},
    {"title": "Paramètres", "icon": Icon(Icons.settings, color: Colors.blue,),
      "route": "/parametres"},
    {"title": "Déconnexion", "icon": Icon(Icons.logout, color: Colors.blue,),
      "route": "/authentification"},
  ];
}