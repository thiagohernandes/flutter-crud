import 'package:crud_api_http_methods/db/db_mysql.dart';
import 'package:crud_api_http_methods/model/produto.dart';
import 'dart:async';
import 'package:flutter/material.dart';

DbMySQL db = new DbMySQL();

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
//    sleep2();
//    printData();
//    print(" ---------------- ");
    insertData(new Produto.fromGet('novo produto 3333333', 76, 390.88)).then((_) =>
        print("Sucesso na inserção!")
    ).catchError((e) {
      print("Houve algum erro: ${e.error}");     // Finally, callback fires.
    });

    printData2().then((_) =>
        print("Sucesso na consulta 2!")
    ).catchError((e) {
      print("Houve algum erro: ${e.error}");     // Finally, callback fires.
    });
//    insertData(new Produto.fromGet('novo produto 3333333', 76, 390.88));
//    updateData(new Produto(46,'1', 1, 1));
//      deleteData(44);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> printData() async{
    List<Produto> lista = await db.printData2();
    for(Produto p in lista) {
      print(p.id.toString() + " -- " + p.descricao + "   " + p.valor.toString());
    }
  }

  Future<void> printData2() async{
    await db.printData();
  }

  Future<void> insertData(Produto produto) async{
    await db.insertData(produto);
  }

  void updateData(Produto produto) async{
    await db.updateData(produto);
  }
  
  void deleteData(int id) async{
    await db.deleteData(id);
  }

  Future sleep2() {
    return new Future.delayed(const Duration(seconds: 2), () => "2");
  }
}

