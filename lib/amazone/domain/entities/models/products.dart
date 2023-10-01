
import 'dart:convert';

class Products{
 final String name;
 final String description;
 final int quantity;
 final double price;
 final String category;
 final List<String> images;
 final String? id;

 Products({required this.category, required this.images,
   this.id, required this.description,
   required  this.quantity,
 required  this.price, required this.name});

 Map<String,dynamic> toMap(){
   return {
     "name":name,
     "description":description,
     "quantity":quantity,
     "price":price,
     "category":category,
     "images":images,
     "id":id,

   };
 }

 factory Products.fromMap (Map<String,dynamic>? map){
  return Products(
      description: map?["description"] ?? "",
      quantity: map?["quantity"].toInt() ?? 0,
      price: map?["price"].toDouble() ?? 0.0,
      name: map?["name"] ?? "",
      category: map?["category"] ?? "",
      id: map?["_id"] ?? "",
      images: List<String>.from(map?["images"] ?? ""),
  ) ;
 }

 String toJson()=> json.encode(toMap());
 factory Products.fromJson(String source)=>
     Products.fromMap(json.decode(source));

}