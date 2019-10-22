import 'package:crud_api_http_methods/model/produto.dart';
import 'package:mysql1/mysql1.dart';

class DbMySQL {

  Future<MySqlConnection> dbConn() async {
    var settings = new ConnectionSettings(
        host: '10.0.2.2',
        port: 3306,
        user: 'root',
        password: 'shtkal',
        db: 'dbprodutos'
    );
    return await MySqlConnection.connect(settings);
  }

  Future<void> printData() async {
    MySqlConnection dbCon = await dbConn();
    var results = await dbCon.query('SELECT id, descricao, qtd, valor FROM tbl_produtos ORDER BY id DESC');
    print("ID     DESCRIÇÃO               QTD     VALOR");
    for (var row in results) {
      print(row["id"].toString()+"\t\t"+row["descricao"].toString()+"\t\t\t\t\t"+row["qtd"].toString()+"\t\t"+row["valor"].toString());
     }
  }

  Future<List<Produto>> printData2() async {
    MySqlConnection dbCon = await dbConn();
    var results = await dbCon.query('SELECT id, descricao, qtd, valor FROM tbl_produtos ORDER BY id DESC');
    List<Produto> listProdutos = new List();
    for (var row in results) {
      listProdutos.add(new Produto(row["id"],row["descricao"],row["qtd"],row["valor"]));
    }
    return listProdutos;
  }

  Future<void> insertData(Produto produto) async{
    MySqlConnection dbCon = await dbConn();
    await dbCon.query('INSERT INTO tbl_produtos(descricao, qtd, valor) VALUES (?, ?, ?)', [produto.descricao, produto.qtd, produto.valor]);
  }

  Future<void> updateData(Produto produto) async{
    MySqlConnection dbCon = await dbConn();
    await dbCon.query('UPDATE tbl_produtos SET descricao = ?, qtd = ?, valor = ? WHERE id = ? ',
        [produto.descricao, produto.qtd, produto.valor, produto.id]);
  }

  Future<void> deleteData(int id) async{
    MySqlConnection dbCon = await dbConn();
    await dbCon.query('DELETE FROM tbl_produtos WHERE id = ? ', [id]);
  }

}
