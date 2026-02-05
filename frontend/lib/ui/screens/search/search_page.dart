import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../data/repositories/category_repository.dart';
import '../../../data/repositories/product_repository.dart';
import '../../../data/repositories/student_repository.dart';
import '../../../models/category.dart';
import '../../../models/product.dart';
import '../../../models/student.dart';
import '../../widgets/common/category_widgets.dart';
import '../../widgets/common/product_grid_card.dart';
import '../../widgets/common/search_bar_widget.dart';
import '../../widgets/common/user_widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final CategoryRepository _categoryRepository = CategoryRepositoryImpl();
  final ProductRepository _productRepository = ProductRepositoryImpl();
  final StudentRepository _studentRepository = StudentRepositoryImpl();
  final TextEditingController _searchController = TextEditingController();
  int? _selectedCategoryIndex;
  late final List<Category> _categories;
  late final List<Product> _products;
  late final List<Student> _students;
  final Set<String> _likedProducts = {};
  final Set<String> _followingStudents = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _categories = _categoryRepository.getCategories();
    _products = _productRepository.getProducts();
    _students = _studentRepository.getStudents();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildListingsTab(),
              _buildStudentsTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: AppColors.primary,
        unselectedLabelColor: Colors.grey,
        indicatorColor: AppColors.primary,
        indicatorWeight: 3,
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        tabs: const [
          Tab(text: 'Listings'),
          Tab(text: 'Students'),
        ],
      ),
    );
  }

  Widget _buildListingsTab() {
    return Column(
      children: [
        SearchBarWidget(
          controller: _searchController,
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: CategoryList(
            categories: _categories,
            selectedIndex: _selectedCategoryIndex,
            onCategorySelected: (index) {
              setState(() => _selectedCategoryIndex = index);
            },
            onSeeAllTap: () {},
            height: 90,
            circleSize: 56,
          ),
        ),
        Expanded(child: _buildProductGrid()),
      ],
    );
  }

  Widget _buildStudentsTab() {
    return Column(
      children: [
        SearchBarWidget(
          controller: _searchController,
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        ),
        Expanded(child: _buildStudentsList()),
      ],
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return ProductGridCard(
          product: product,
          isLiked: _likedProducts.contains(product.id),
          onTap: () {},
          onLikeTap: () {
            setState(() {
              if (_likedProducts.contains(product.id)) {
                _likedProducts.remove(product.id);
              } else {
                _likedProducts.add(product.id);
              }
            });
          },
        );
      },
    );
  }

  Widget _buildStudentsList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _students.length,
      itemBuilder: (context, index) {
        final student = _students[index];
        return StudentListTile(
          student: student,
          isFollowing: _followingStudents.contains(student.id),
          onTap: () {},
          onFollowTap: () {
            setState(() {
              if (_followingStudents.contains(student.id)) {
                _followingStudents.remove(student.id);
              } else {
                _followingStudents.add(student.id);
              }
            });
          },
        );
      },
    );
  }
}
