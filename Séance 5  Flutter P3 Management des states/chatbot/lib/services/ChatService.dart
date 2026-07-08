import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatService {
  final String apiKey;
  final String endpoint;
  final String model;
  final double temperature;


  //Constructor
  ChatService({
    required this.apiKey,
    required this.endpoint,
    this.model = 'llama-3.3-70b-versatile',
    this.temperature = 0.7,
  });

  //Methods
  Future<http.Response> _sendRequest(
      List<Map<String, String>> messages) {
    return http.post(
      Uri.parse(endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': model,
        'messages': messages,
        'temperature': temperature,
      }),
    );
  }

  String _parseResponse(http.Response response) {
    if (response.statusCode != 200) {
      throw Exception(
        'API Error (${response.statusCode}): ${response.body}',
      );
    }

    final data = jsonDecode(utf8.decode(response.bodyBytes));

    return data['choices'][0]['message']['content']
        .toString()
        .trim();
  }

  Future<String> sendMessage(
      List<Map<String, String>> messages) async {
    final response = await _sendRequest(messages);
    return _parseResponse(response);
  }

}