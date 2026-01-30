import 'package:flutter/material.dart';
import '../../../mock/mock_data.dart';
import '../widgets/category_list.dart';
import '../widgets/product_card.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({super.key});

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  final PageController _pageController = PageController();
  Category? _selectedCategory;
  List<Product> _filteredProducts = mockProducts;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onCategorySelected(Category? category) {
    setState(() {
      _selectedCategory = category;
      if (category == null) {
        _filteredProducts = mockProducts;
      } else {
        _filteredProducts = mockProducts
            .where((product) => product.category.id == category.id)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Category filter
        CategoryList(onCategorySelected: _onCategorySelected),

        const Divider(height: 1),

        // TikTok-style vertical scrolling product feed
        Expanded(
          child: _filteredProducts.isEmpty
              ? _buildEmptyState()
              : PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  itemCount: _filteredProducts.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: _filteredProducts[index]);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No products found',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try selecting a different category',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}