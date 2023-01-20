import 'dart:ffi';

import 'package:uuid/uuid.dart';
const _uuid = Uuid();
class Cibo{
  String id;
  String name;
  String description;
  num price;
  String image;

  Cibo(this.id,this.name,this.description,this.price,this.image);
  factory Cibo.fromJson(Map<String, dynamic> json){
     return Cibo(json["id"], json["name"], json["description"], json["price"], json["image"]);
  }

  Map<String, dynamic> toMap() => {
    'id':id,
    'name':name,
    'description':description,
    'price':price,
    'image':image
  };
  
  @override
  String toString() {
    return name;
  }
}