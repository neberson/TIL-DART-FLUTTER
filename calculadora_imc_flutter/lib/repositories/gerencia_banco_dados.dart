import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class GerenciaBancoDeDados {
  static Database? _dataBase;

  Future<Database> retornaBancoDeDados() async {
    if (_dataBase != null) {
      return _dataBase!;
    }
    _dataBase = await _iniciaBancoDeDados();
    return _dataBase!;
  }

  Future<Database> _iniciaBancoDeDados() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'imc.db');

    return await openDatabase(path, version: 1, onCreate: _criarBandoDeDados);
  }

  Future<void> _criarBandoDeDados(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE IMC(id INTEGER PRIMARY KEY AUTOINCREMENT, altura REAL, peso REAL, imcCalculado REAL);''');
  }
}
