import 'package:dio_retrofit_poc/data/network/dto/product_dto.dart';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
  });

  factory ProductModel.fromDto(ProductDto productDto) => ProductModel(
        id: productDto.id,
        name: productDto.title,
        description: productDto.description,
        images: productDto.images,
        price: productDto.price,
      );
}
