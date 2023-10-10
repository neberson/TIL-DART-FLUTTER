import 'package:calculadora_imc_flutter/model/imc_model.dart';
import 'package:calculadora_imc_flutter/repositories/gerencia_banco_dados.dart';

class IMCRepository {
  Future<void> salvar(IMC imc) async {
    var db = await GerenciaBancoDeDados().retornaBancoDeDados();
    db.rawInsert('INSERT INTO IMC(altura, peso, imcCalculado) VALUES(?,?,?);',
        [imc.altura, imc.peso, imc.imc]);
  }

  Future<List<IMC>> obterIMCRegistrados() async {
    var db = await GerenciaBancoDeDados().retornaBancoDeDados();
    List<IMC> imcRegistrados = [];

    var result =
        await db.rawQuery('SELECT id, peso, altura, imcCalculado FROM IMC');

    for (var element in result) {
      imcRegistrados.add(IMC(
          id: int.parse(element['id'].toString()),
          altura: double.parse(element['altura'].toString()),
          peso: double.parse(element['peso'].toString()),
          imc: double.parse(element['imcCalculado'].toString())));
    }

    return imcRegistrados;
  }
}
