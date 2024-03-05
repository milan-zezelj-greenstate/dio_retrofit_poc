import 'package:dio_retrofit_poc/data/network/dto/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_dto.g.dart';

@JsonSerializable()
class ProductsDto {
  final List<ProductDto> products;
  final int total;
  final int skip;
  final int limit;

  ProductsDto({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductsDto.fromJson(Map<String, dynamic> json) =>
      _$ProductsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsDtoToJson(this);
}
