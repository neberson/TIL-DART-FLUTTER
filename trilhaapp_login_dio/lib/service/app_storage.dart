import 'package:shared_preferences/shared_preferences.dart';

enum StorageChaves {
  chaveSharedPreferenceNome,
  chaveSharedPreferenceDtNascimento,
  chaveSharedPreferenceNivelExperiencia,
  chaveSharedPreferenceLinguagensPreferidas,
  chaveSharedPreferenceTempoExperiencia,
  chaveSharedPreferencePretensaoSalarial,
  chaveNomeUsuario,
  chaveAltura,
  chaveReceberNotificacao,
  chaveTemaEscuro;
}

class AppStorageService {
  Future<void> setConfiguracoesNomeUsuario(String nome) async {
    await _setString(StorageChaves.chaveNomeUsuario, nome);
  }

  Future<String> getConfiguracoesNomeUsuario() async {
    return await _getString(StorageChaves.chaveNomeUsuario);
  }

  Future<void> setConfiguracoesAltura(double altura) async {
    await _setDouble(StorageChaves.chaveAltura, altura);
  }

  Future<double> getConfiguracoesAltura() async {
    return await _getDouble(StorageChaves.chaveAltura);
  }

  Future<void> setConfiguracoesReceberNotificacao(
      bool receberNotificacao) async {
    await _setBool(StorageChaves.chaveReceberNotificacao, receberNotificacao);
  }

  Future<bool> getConfiguracoesReceberNotificacao() async {
    return await _getBool(StorageChaves.chaveReceberNotificacao);
  }

  Future<void> setConfiguracoesTemaEscuro(bool TemaEscuro) async {
    await _setBool(StorageChaves.chaveTemaEscuro, TemaEscuro);
  }

  Future<bool> getConfiguracoesTemaEscuro() async {
    return await _getBool(StorageChaves.chaveTemaEscuro);
  }

  Future<void> setDadosCadastraisNome(String nome) async {
    await _setString(StorageChaves.chaveSharedPreferenceNome, nome);
  }

  Future<String> getDadosCadastraisNome() async {
    return await _getString(StorageChaves.chaveSharedPreferenceNome);
  }

  Future<void> setDadosCadastraisDataNascimento(String data) async {
    await _setString(StorageChaves.chaveSharedPreferenceDtNascimento, data);
  }

  Future<String> getDadosDataNascimento() async {
    return await _getString(StorageChaves.chaveSharedPreferenceDtNascimento);
  }

  Future<void> setDadosCadastraisNivelExperiencia(String nivel) async {
    await _setString(
        StorageChaves.chaveSharedPreferenceNivelExperiencia, nivel);
  }

  Future<String> getDadosNivelExperiencia() async {
    return await _getString(
        StorageChaves.chaveSharedPreferenceNivelExperiencia);
  }

  Future<void> setDadosCadastraisLinguagensPreferidas(
      List<String> linguagens) async {
    await _setStringList(
        StorageChaves.chaveSharedPreferenceLinguagensPreferidas, linguagens);
  }

  Future<List<String>> getDadosLinguagensPreferidas() async {
    return await _getStringList(
        StorageChaves.chaveSharedPreferenceLinguagensPreferidas);
  }

  Future<void> setDadosCadastraisTempoExperiencia(int tempo) async {
    await _setInt(StorageChaves.chaveSharedPreferenceTempoExperiencia, tempo);
  }

  Future<int> getDadosTempoExperiencia() async {
    return await _getInt(StorageChaves.chaveSharedPreferenceTempoExperiencia);
  }

  Future<void> setDadosCadastraisPretensaoSalarial(double pretensao) async {
    await _setDouble(
        StorageChaves.chaveSharedPreferencePretensaoSalarial, pretensao);
  }

  Future<double> getDadosPretensaoSalarial() async {
    return await _getDouble(
        StorageChaves.chaveSharedPreferencePretensaoSalarial);
  }

  Future<void> _setString(StorageChaves chave, String valor) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setString(chave.toString(), valor);
  }

  Future<String> _getString(StorageChaves chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave.toString()) ?? '';
  }

  Future<void> _setStringList(StorageChaves chave, List<String> valor) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setStringList(chave.toString(), valor);
  }

  Future<List<String>> _getStringList(StorageChaves chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave.toString()) ?? [];
  }

  Future<void> _setInt(StorageChaves chave, int valor) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setInt(chave.toString(), valor);
  }

  Future<int> _getInt(StorageChaves chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave.toString()) ?? 1;
  }

  Future<void> _setDouble(StorageChaves chave, double valor) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(chave.toString(), valor);
  }

  Future<double> _getDouble(StorageChaves chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave.toString()) ?? 1000.0;
  }

  Future<void> _setBool(StorageChaves chave, bool valor) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(chave.toString(), valor);
  }

  Future<bool> _getBool(StorageChaves chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave.toString()) ?? false;
  }
}
