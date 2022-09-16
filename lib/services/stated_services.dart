import 'dart:convert';
import 'package:apis/models/world_states_model/world_states_model.dart';
import 'package:apis/utils/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<worldStatesModel> fecthWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatusApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return worldStatesModel.fromJson(data);
    } else {
      throw Exception('error');
    }
  }

  Future<List<dynamic>> CounrtiesListApi() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesStatusApi));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('error');
    }
  }
}
