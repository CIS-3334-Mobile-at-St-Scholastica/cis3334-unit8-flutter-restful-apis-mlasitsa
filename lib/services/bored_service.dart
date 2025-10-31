import 'package:http/http.dart' as http;
import '../data_models/bored_activity_model.dart';

Future<BoredActivity> fetchBoredActivity() async {
  try {
    final uri = Uri.parse('https://bored-api.appbrewery.com/random');
    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw Exception('Bored API ${resp.statusCode}');
    }

    return boredActivityFromJson(resp.body);
  } catch (e) {
    throw Exception("Network error: $e");
  }
}
