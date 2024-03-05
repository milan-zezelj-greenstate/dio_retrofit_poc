import 'package:dio_retrofit_poc/data/network/repositories/product_repository_impl.dart';
import 'package:dio_retrofit_poc/domain/models/product_model.dart';
import 'package:dio_retrofit_poc/domain/repositories/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_service.g.dart';

@riverpod
ProductService productService(ProductServiceRef ref) {
  return _ProductServiceImpl(ref);
}

abstract interface class ProductService {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProduct(int id);
}

class _ProductServiceImpl implements ProductService {
  final ProductRepository _repository;

  _ProductServiceImpl(Ref ref)
      : _repository = ref.read(productRepositoryProvider);

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final productDtos = await _repository.getProducts();

    return Future.value(
        productDtos.products.map((e) => ProductModel.fromDto(e)).toList());
  }

  @override
  Future<ProductModel> getProduct(int id) async {
    final productDto = await _repository.getProduct(id);
    return Future.value(ProductModel.fromDto(productDto));
  }
}
