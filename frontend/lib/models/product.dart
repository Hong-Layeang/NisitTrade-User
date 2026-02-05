import 'category.dart';
import 'seller.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final List<String> images;
  final Seller seller;
  final Category category;
  final int likes;
  final int comments;
  final String timeAgo;
  final bool isLiked;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.seller,
    required this.category,
    required this.likes,
    required this.comments,
    required this.timeAgo,
    this.isLiked = false,
  });
}
