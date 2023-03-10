//@dart=2.9
import 'package:http/http.dart' as http;
import 'package:sozluk/models/dictionay_model.dart';
import 'package:sozluk/models/error_model.dart';
import 'package:sozluk/providers/status_provider.dart';

class DictionaryService {
  static final baseURL = "https://api.dictionaryapi.dev/api/v2/entries/en_US/";
  Future<List<DictionaryModel>> get(query) async {
    http.Response response;
    final url = Uri.parse("$baseURL$query");
    StatusProvider status = StatusProvider();
    try {
      response = await http.get(url);
      // print(response.statusCode);
      status.listenToStatus(response.statusCode);
      print("From service");
      print(status.status);
      if (response.statusCode == 200) {
        var res = dictionaryModelFromJson(response.body);
        return res;
      } else
        return null;
    } on Exception catch (e) {
      print("object");
      print(e.toString());
      throw e;
    }
  }
}

class ErrorService {
  static final baseURL = "https://api.dictionaryapi.dev/api/v2/entries/en_US/";

  Future get(query) async {
    http.Response response;
    final url = Uri.parse("$baseURL$query");

    try {
      response = await http.get(url);
      // print(response.statusCode);

      if (response.statusCode == 200) {
        var res = errorModelFromJson(response.body);
        return res;
      } else
        return null;
    } on Exception catch (e) {
      print("object");
      print(e.toString());
      throw e;
    }
  }
}
