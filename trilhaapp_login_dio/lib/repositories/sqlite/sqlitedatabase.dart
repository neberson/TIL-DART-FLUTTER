import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteDataBase {
  static Database? _db;

  Future<Database> obterDataBase() async {
    if (_db != null) {
      return _db!;
    }
    _db = await iniciarBancoDeDados();
    return _db!;
  }

  Future<Database> iniciarBancoDeDados() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'database');
    return await openDatabase(path, version: 1, onCreate: _CriaBancoDeDados);
  }

  Future<void> _CriaBancoDeDados(Database dataBase, int version) async {
    await _CriarTabelaTarefas(dataBase);
  }

  Future<void> _CriarTabelaTarefas(Database db) async {
    await db.execute(''' CREATE TABLE tarefas (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          descricao TEXT,
          concluido INTEGER
          );''');
  }
}
