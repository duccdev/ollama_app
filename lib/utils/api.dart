import 'package:http/http.dart' as http;
import 'package:ollama_app/globals.dart';

Future<bool> isConnected() async {
  if (Globals.baseUrl == null) return false;

  try {
    var response = await http.get(Uri.parse(Globals.baseUrl!));
    if (response.statusCode != 200) return false;
  } catch (e) {
    return false;
  }

  return true;
}
