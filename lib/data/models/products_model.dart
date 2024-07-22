// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio_package/data/models/category.dart';
import 'package:flutter/foundation.dart';

// class ProductsModel {
//   final int id;
//   String title;
//   num price;
//   String description;
//   List<String> images;
//   // String creationAt;
//   // String updatedAt;

//   ProductsModel({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.images,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'title': title,
//       'price': price,
//       'description': description,
//       'images': images,
//     };
//   }

//   factory ProductsModel.fromMap(Map<String, dynamic> map) {
//     return ProductsModel(
//       id: map['id'] as int,
//       title: map['title'] as String,
//       price: map['price'] as num,
//       description: map['description'] as String,
//       images: List<String>.from(
//         (map['images']),
//       ),
//     );
//   }
// }

/* import 'package:dio_package/data/models/category.dart';

class ProductsModel {
  final int id;
  String title;
  num price;
  String description;
  Category category;
  List<String> images;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'images': images,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
        id: map['id'] as int,
        title: map['title'] as String,
        price: map['price'] as num,
        description: map['description'] as String,
        category: Category.fromMap(map['category']),
        images: List<String>.from(
          (map['images']),
        ));
  }
} */

// class ProductsModel {
//   final int id;
//   String title;
//   num price;
//   String description;
//   Category category;
//   List<String> images;
//   String creationAt;
//   String updatedAt;
//   ProductsModel({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.category,
//     required this.images,
//     required this.creationAt,
//     required this.updatedAt,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'title': title,
//       'price': price,
//       'description': description,
//       'category': category,
//       'images': images,
//       'creationAt': creationAt,
//       'updatedAt': updatedAt,
//     };
//   }

//   factory ProductsModel.fromMap(Map<String, dynamic> map) {
//     return ProductsModel(
//       id: map['id'] as int,
//       title: map['title'] as String,
//       price: map['price'] as num,
//       description: map['description'] as String,
//       category: Category.fromMap(map['category']),
//       images: List<String>.from((map['images'] as List<String>),
//       creationAt: map['creationAt'] as String,
//       updatedAt: map['updatedAt'] as String,
//     ),);
//   }

//   String toJson() => json.encode(toMap());

//   factory ProductsModel.fromJson(String source) => ProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'ProductsModel(id: $id, title: $title, price: $price, description: $description, category: $category, images: $images, creationAt: $creationAt, updatedAt: $updatedAt)';
//   }
// }

class ProductsModel {
  final int id;
  String title;
  num price;
  String description;
  CategoryModel category;
  List<String> images;
  String creationAt;
  String updatedAt;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category.toMap(), // Assuming toMap method in Category class
      'images': images,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as num,
      description: map['description'] as String,
      category: CategoryModel.fromMap(map['category']),
      images: List<String>.from(map['images'] as List),
      creationAt: map['creationAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) =>
      ProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductsModel(id: $id, title: $title, price: $price, description: $description, category: $category, images: $images, creationAt: $creationAt, updatedAt: $updatedAt)';
  }
}
