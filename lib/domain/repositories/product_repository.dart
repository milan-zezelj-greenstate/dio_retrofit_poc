import 'package:dio_retrofit_poc/data/network/dto/product_dto.dart';
import 'package:dio_retrofit_poc/data/network/dto/products_dto.dart';

abstract interface class ProductRepository {
  Future<ProductsDto> getProducts();
  Future<ProductDto> getProduct(int id);
}
