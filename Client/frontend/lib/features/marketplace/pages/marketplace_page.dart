import 'package:flutter/material.dart';
import '../../../mock/mock_data.dart';
import '../../../shared/widgets/category_widgets.dart';
import '../../../shared/widgets/empty_state.dart';
import '../widgets/product_card.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({super.key});

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  final PageController _pageController = PageController();
  int? _selectedCategoryIndex;
  List<Product> _filteredProducts = mockProducts;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onCategorySelected(int? index) {
    setState(() {
      _selectedCategoryIndex = index;
      if (index == null) {
        _filteredProducts = mockProducts;
      } else {
        final category = mockCategories[index];
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
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: CategoryList(
            categories: mockCategories,
            selectedIndex: _selectedCategoryIndex,
            onCategorySelected: _onCategorySelected,
            height: 90,
            circleSize: 56,
          ),
        ),
        Divider(height: 1, color: Colors.grey.shade100),
        Expanded(
          child: _filteredProducts.isEmpty
              ? const EmptyState(
                  icon: Icons.shopping_bag_outlined,
                  title: 'No products found',
                  subtitle: 'Try selecting a different category',
                )
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
}