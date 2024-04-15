import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/api_contants.dart';
import 'package:flutter_application_1/services/api_services.dart';
import 'package:http/http.dart' as http;

class HomeController extends ChangeNotifier {
  ApiService apiService = ApiService();
  ValueNotifier<List<Map<String, dynamic>>> dados = ValueNotifier([]);
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  Future<dynamic> chamarApi({String? categoria, String? descricao}) async {
    isLoading.value = true;

    final response = await fetch(categoria: categoria, descricao: descricao);

    if (response.isNotEmpty) {
      dados.value = response;
    } else {
      // Lida com o caso em que a resposta está vazia ou nula
      dados.value = [];
    }

    isLoading.value = false;
    return response;
  }

  Future<List<Map<String, dynamic>>> fetch(
      {String? categoria, String? descricao}) async {
    var url = ApiConstants.urlBase(categoria: categoria, descricao: descricao);
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(jsonResponse);
    } else {
      print('erro: ${response.statusCode}');
      return []; // ou retorne null, dependendo do comportamento desejado
    }
  }
}
