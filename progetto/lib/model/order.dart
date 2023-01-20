import 'package:uuid/uuid.dart';

import 'cibo.dart';

class Ordination {
  String id;
  List<Cibo> ciboList;
  String tableNumber;

  Ordination(this.id,this.ciboList,this.tableNumber);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ciboList':ciboList,
      'tableNumber':tableNumber
    };
    }
    dynamic getListMap(List<dynamic> items) {
      if (items == null) {
        return null;
        }
        List<Map<String, dynamic>> dayItems = [];
        for (var element in items) {
          dayItems.add(element.toMap());
          }
          return dayItems;
}
  factory Ordination.fromJson(dynamic json) {
      var ciboObjsJson = json['ciboList'] as List;
      List<Cibo> cibos = ciboObjsJson.map((ciboJson) => Cibo.fromJson(ciboJson)).toList();

      return Ordination(
        json['id'],
        cibos,
        json['tableNumber'],
      );
    }

  }