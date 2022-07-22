import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  String? id;
  String? name;
  int? price;
  String? status;
  String? statusName;
  String? category;
  String? categoryName;
  String? desc;
  List<String> images;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic comment;

  Product(
      {this.id,
      this.name,
      this.price,
      this.status,
      this.statusName,
      this.category,
      this.categoryName,
      this.desc,
      required this.images,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.comment});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
