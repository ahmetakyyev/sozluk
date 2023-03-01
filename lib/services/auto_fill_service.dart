//@dart=2.9
import 'package:http/http.dart' as http;
import 'package:sozluk/models/auto_fill_model.dart';

class AutoFillService {
  static final baseURL = "https://api.datamuse.com/words?sp=";
  Future<List<AutoCompleteModel>> get(query) async {
    http.Response response;
    final url = Uri.parse("$baseURL$query*");
    try {
      response = await http.get(url);
      if (response.statusCode == 200) {
        var res = autoCompleteModelFromJson(response.body);
        print(response.body);
        return res;
      } else
        return null;
    } on Exception catch (e) {
      throw e;
    }
  }
}
