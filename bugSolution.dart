```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      //Further processing of data
      print('Data fetched successfully: $jsonData');
    } else if (response.statusCode == 404) {
      print('Error: Resource not found');
    } else if (response.statusCode == 500) {
      print('Error: Server error');
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on FormatException catch (e) {
    print('Error decoding JSON: $e');
  } on SocketException catch (e) {
    print('Network error: $e');
  } catch (e) {
    print('An unexpected error occurred: $e');
    rethrow;
  }
}
```