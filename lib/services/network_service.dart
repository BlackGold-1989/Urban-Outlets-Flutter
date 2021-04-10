import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:urban_outlets/services/load_service.dart';
import 'package:http/http.dart' as http;
import 'package:urban_outlets/utils/consts.dart';

final String domain = 'app.ecwid.com';

class NetworkService {
  final BuildContext context;

  NetworkService(this.context);

  Future<dynamic> ajax(String link, {bool isProgress = false}) async {
    if (isProgress && context != null) LoadService().showLoading(context);

    // var url = Uri.https(domain, '/api/v3/$appID/$link', {'q': '{https}'});
    var url  = Uri.parse('https://$domain/api/v3/$appID/$link');

    print('===== response link ===== \n${url.toString()}');

    final response = await http.get(url,
      headers: {'Content-Type' : 'application/json;charset=utf-8'},
    ).timeout(Duration(minutes: 1));
    if (isProgress && context != null) LoadService().hideLoading(context);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print('===== $link response ===== \n${response.body}');
      return jsonDecode(response.body);
    } else {
      print(link + ' failed ===> ${response.statusCode}');
      Exception(response.statusCode);
    }
  }

}