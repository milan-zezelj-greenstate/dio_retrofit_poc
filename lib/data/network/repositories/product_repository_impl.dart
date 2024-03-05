import 'package:dio/dio.dart';
import 'package:dio_retrofit_poc/data/network/dio/dio.dart';
import 'package:dio_retrofit_poc/data/network/dto/product_dto.dart';
import 'package:dio_retrofit_poc/data/network/dto/products_dto.dart';
import 'package:dio_retrofit_poc/domain/repositories/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'product_repository_impl.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  final productDatasource = ref.read(dioProvider);
  return _ProductRepositoryImpl(productDatasource);
}

@RestApi(baseUrl: "products")
abstract class _ProductRepositoryImpl implements ProductRepository {
  factory _ProductRepositoryImpl(Dio productDatasource, {String baseUrl}) =
      __ProductRepositoryImpl;

  @override
  @GET("/{id}")
  Future<ProductDto> getProduct(@Path('id') int id);

  @override
  @GET("")
  Future<ProductsDto> getProducts();
}
