// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'products_model.freezed.dart';
part 'products_model.g.dart';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

@freezed
class ProductsModel with _$ProductsModel {
  const factory ProductsModel({@JsonKey(name: "products") List<Product>? products}) =
      _ProductsModel;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "price") double? price,
    @JsonKey(name: "short_desc") String? shortDesc,
    @JsonKey(name: "long_desc") String? longDesc,
    @JsonKey(name: "images") List<String>? images,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
