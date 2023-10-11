import 'dart:convert';
import 'package:trilhaapp/model/via_cep_model.dart';
import 'package:http/http.dart' as http;

class ViaCepRespository {
  Future<ViaCepModel> consultarCEP(String cep) async {
    var response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ViaCepModel.fromJson(json);
    }
    return ViaCepModel();
  }
}
