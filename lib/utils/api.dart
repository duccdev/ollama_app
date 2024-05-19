import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ollama_app/globals.dart';

Future<bool> isConnected() async {
  if (Globals.baseUrl == null) return false;

  try {
    var response = await http.get(Uri.parse(Globals.baseUrl!));
    if (response.statusCode != 200) return false;
    return true;
  } catch (e) {
    return false;
  }
}

Future<String?> infer(String prompt, String model) async {
  if (Globals.baseUrl == null) return null;

  try {
    var response = await http.post(
      Uri.parse('${Globals.baseUrl!}/api/generate'),
      body: jsonEncode({'model': model, 'prompt': prompt, 'stream': false}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) return null;

    return (jsonDecode(response.body) as Map<String, dynamic>)['response'];
  } catch (e) {
    return null;
  }
}
