import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progetto/model/order.dart';

class Database {
  static final Database _singleton = Database._internal();

  factory Database() {
    return _singleton;
  }

  Database._internal();

  Stream<List<Ordination>> readOrdination () => FirebaseFirestore.instance.collection('orders').snapshots().map((snapshot) => snapshot.docs.map((doc) => Ordination.fromJson(doc.data())).toList());

  Future saveOrderToDatabase({required Ordination order}) async {
    final docOrder = FirebaseFirestore.instance.collection('orders').doc(order.id);
    final json = {
      'id':order.id,
      'ciboList':order.getListMap(order.ciboList),
      'tableNumber':order.tableNumber
    };

    await docOrder.set(json);
  }
  
}
