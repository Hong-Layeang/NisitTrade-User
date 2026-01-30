import 'package:flutter/material.dart';
import '../../../mock/mock_data.dart';

class CategoryList extends StatefulWidget {
  final Function(Category?)? onCategorySelected;

  const CategoryList({super.key, this.onCategorySelected});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: mockCategories.length + 1, // +1 for "See All"
        itemBuilder: (context, index) {
          if (index == mockCategories.length) {
            return _buildSeeAllItem();
          }
          return _buildCategoryItem(index, mockCategories[index]);
        },
      ),
    );
  }

  Widget _buildCategoryItem(int index, Category category) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = selectedIndex == index ? null : index;
        });
        widget.onCategorySelected?.call(selectedIndex != null ? category : null);
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFF00B4D8) : Colors.grey.shade300,
                  width: isSelected ? 3 : 2,
                ),
              ),
              child: ClipOval(
                child: Image.network(
                  category.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade200,
                    child: Icon(
                      Icons.category,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              category.name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? const Color(0xFF00B4D8) : Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeeAllItem() {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF00B4D8),
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.grid_view_rounded,
              color: Color(0xFF00B4D8),
              size: 28,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'See All',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF00B4D8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
