import 'package:flutter/material.dart';
import 'package:app_synthese/pages/contacts.page.dart';
import 'package:app_synthese/pages/counter.page.dart';
import 'package:app_synthese/pages/gallery.page.dart';
import 'package:app_synthese/pages/home.page.dart';
import 'package:app_synthese/pages/meteo.page.dart';


class GlobalParameters {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomePage(),
    '/counter': (context) => const CounterPage(),
    '/contacts': (context) => const ContactsPage(),
    '/meteo': (context) => const MeteoPage(),
    '/gallery': (context) => const GalleryPage(),
    //'/login': (context) => const LoginPage(),
  };

  static final List<Map<String, dynamic>> menus = [
    {'title': 'Home', 'route': '/', 'icon': const Icon(Icons.home)},
    {'title': 'Counter', 'route': '/counter', 'icon': const Icon(Icons.memory)},
    {'title': 'Contacts', 'route': '/contacts', 'icon': const Icon(Icons.contacts)},
    {'title': 'Meteo', 'route': '/meteo', 'icon': const Icon(Icons.repeat)},
    {'title': 'Gallery', 'route': '/gallery', 'icon': const Icon(Icons.camera)},
  ];
}