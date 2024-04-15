import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/api_contants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/category_models.dart';

class ApiService {
  // CategoryModel
  Future<List<dynamic>> fetch({String? categoria, String? descricao}) async {
    var url = ApiConstants.urlBase(categoria: categoria, descricao: descricao);
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as List<dynamic>;
      // CategoryModel
      List<dynamic> categoryList =
          jsonResponse.map((json) => CategoryModel.fromJson(json)).toList();
      return categoryList;
    } else {
      print('erro: ${response.statusCode}');
      return [];
    }
  }
}
