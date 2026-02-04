import 'package:flutter/material.dart';
import 'package:frontend/core/constants/colors.dart';

class SellPage extends StatefulWidget {
  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  final List<String> categories = ["Electronics", "Fashion", "Books", "Others"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Add your Listing',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            // Title field
            Text(
              "Title",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(color: AppColors.textSecondary),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Description field
            Text(
              'Description',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Detailed description of your product",
                hintStyle: TextStyle(color: AppColors.textSecondary),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Category + Price row
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Category",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6),
                      DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        hint: Center(
                          child: Text(
                            "Select",
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                        ),
                        value: _selectedCategory,
                        items: categories.map((cat) {
                          return DropdownMenuItem(
                            value: cat,
                            child: Center(child: Text(cat)),
                          );
                        }).toList(),
                        onChanged: (val) =>
                            setState(() => _selectedCategory = val),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Price (in \$)",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0.0",
                          hintStyle: TextStyle(color: AppColors.textSecondary),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Photos section
            Text(
              "Photos",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              "Capture all the angles and details. Your first square is the key image.",
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            Text(
              'At least 2 photos required.',
              style: TextStyle(color: AppColors.primary),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // TODO: implement image picker
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: const Center(
                      child: Icon(Icons.add, size: 32, color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),

            // Add button
            Center(
              child: SizedBox(
                width: 180,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: handle submit
                    }
                  },
                  child: const Text("Add"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SellAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onChatTap;

  const SellAppBar({super.key, this.onFavoriteTap, this.onChatTap});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF00B4D8),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xFF00B4D8),
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'NisitTrade',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: onFavoriteTap,
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 26,
          ),
        ),
        IconButton(
          onPressed: onChatTap,
          icon: const Icon(
            Icons.chat_bubble_outline,
            color: Colors.white,
            size: 26,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
