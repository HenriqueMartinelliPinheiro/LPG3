import 'package:http/http.dart' as http;
 import 'package:flutter/material.dart';
 import 'dart:convert';

String route = "https://api.chucknorris.io/jokes/random";

class Api{

  static Future getFrase()async{
    return await http.get(Uri.parse(route));
  }

  }