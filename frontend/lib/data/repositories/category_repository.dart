import '../../models/category.dart';
import '../mock/mock_data.dart';

abstract class CategoryRepository {
  List<Category> getCategories();
}

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  List<Category> getCategories() {
    return mockCategories;
  }
}
