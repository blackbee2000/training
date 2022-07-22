// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as String?,
    name: json['name'] as String?,
    price: json['price'] as int?,
    status: json['status'] as String?,
    statusName: json['statusName'] as String?,
    category: json['category'] as String?,
    categoryName: json['categoryName'] as String?,
    desc: json['desc'] as String?,
    images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    createdBy: json['createdBy'] as String?,
    updatedBy: json['updatedBy'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    comment: json['comment'],
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'status': instance.status,
      'statusName': instance.statusName,
      'category': instance.category,
      'categoryName': instance.categoryName,
      'desc': instance.desc,
      'images': instance.images,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'comment': instance.comment,
    };
