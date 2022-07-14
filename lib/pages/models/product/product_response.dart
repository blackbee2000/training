import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  List<Product>? record;

  ProductResponse({
    this.record,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
