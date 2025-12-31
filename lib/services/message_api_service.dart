
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:http/http.dart' as http;

class MessageApiService {
  static Future<String> fetchReceiverMessage() async {
    try {
      final res = await http.get(Uri.parse('https://api.quotable.io/random'));

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['content'];
      } else {
        return 'No response from server';
      }
    } catch (e) {
      // This handles NO INTERNET, DNS failure, etc.
      return 'Receiver is offline';
    }
  }
}


