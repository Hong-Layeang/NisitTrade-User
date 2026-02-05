import '../../models/product.dart';
import '../mock/mock_data.dart';

abstract class ProductRepository {
  List<Product> getProducts();
  List<Product> getProductsByCategoryId(String categoryId);
}

class ProductRepositoryImpl implements ProductRepository {
  @override
  List<Product> getProducts() {
    return mockProducts;
  }

  @override
  List<Product> getProductsByCategoryId(String categoryId) {
    return mockProducts
        .where((product) => product.category.id == categoryId)
        .toList();
  }
}
