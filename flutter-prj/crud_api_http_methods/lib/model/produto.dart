
class Produto {
  int _id;
  String _descricao;
  int _qtd;
  double _valor;

  Produto(int id, String descricao, int qtd, double valor) {
    this._id = id;
    this._descricao = descricao;
    this._qtd = qtd;
    this._valor = valor;
  }

  Produto.fromGet(String descricao, int qtd, double valor) {
    this._descricao = descricao;
    this._qtd = qtd;
    this._valor = valor;
  }

  int get id {
    return _id;
  }

  String get descricao {
    return _descricao;
  }

  int get qtd {
    return _qtd;
  }

  double get valor {
    return _valor;
  }

}