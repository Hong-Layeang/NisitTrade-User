// Category model
class Category {
  final String id;
  final String name;
  final String imageUrl;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}

// Seller model
class Seller {
  final String id;
  final String name;
  final String username;
  final String avatarUrl;
  final String faculty;

  const Seller({
    required this.id,
    required this.name,
    required this.username,
    required this.avatarUrl,
    required this.faculty,
  });
}

// Product model
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

// Mock Categories
final List<Category> mockCategories = [
  const Category(
    id: 'c1',
    name: 'Clothing',
    imageUrl: 'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=200',
  ),
  const Category(
    id: 'c2',
    name: 'Pants',
    imageUrl: 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=200',
  ),
  const Category(
    id: 'c3',
    name: 'Electronic',
    imageUrl: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=200',
  ),
  const Category(
    id: 'c4',
    name: 'Accessories',
    imageUrl: 'https://images.unsplash.com/photo-1523779105320-d1cd346ff52b?w=200',
  ),
  const Category(
    id: 'c5',
    name: 'Books',
    imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=200',
  ),
  const Category(
    id: 'c6',
    name: 'Sports',
    imageUrl: 'https://images.unsplash.com/photo-1461896836934- voices-50fc3f85?w=200',
  ),
];

// Mock Sellers
const List<Seller> mockSellers = [
  Seller(
    id: 'u1',
    name: 'Virak Dara',
    username: '@cadt',
    avatarUrl: 'https://i.pravatar.cc/150?img=11',
    faculty: 'IT',
  ),
  Seller(
    id: 'u2',
    name: 'John Smith',
    username: '@johnsmith',
    avatarUrl: 'https://i.pravatar.cc/150?img=12',
    faculty: 'Engineering',
  ),
  Seller(
    id: 'u3',
    name: 'Sarah Lee',
    username: '@sarahlee',
    avatarUrl: 'https://i.pravatar.cc/150?img=5',
    faculty: 'Business',
  ),
  Seller(
    id: 'u4',
    name: 'Mike Chen',
    username: '@mikechen',
    avatarUrl: 'https://i.pravatar.cc/150?img=8',
    faculty: 'Design',
  ),
  Seller(
    id: 'u5',
    name: 'Emma Wilson',
    username: '@emmaw',
    avatarUrl: 'https://i.pravatar.cc/150?img=9',
    faculty: 'Medicine',
  ),
];

// Mock Products with local images
final List<Product> mockProducts = [
  Product(
    id: 'p1',
    title: 'Wireless Headphones – Good Sound',
    description: 'Comfortable Bluetooth headphones with clear sound and strong bass. Battery still lasts long, connection stable. Light signs of use but clean and well cared for.',
    price: 45.00,
    images: [
      'assets/images/products/airpods.png',
      'assets/images/products/airpods.png',
      'assets/images/products/airpods.png',
      'assets/images/products/airpods.png',
      'assets/images/products/airpods.png',
      'assets/images/products/airpods.png',
      'assets/images/products/airpods.png',
      'assets/images/products/airpods.png',
    ],
    seller: mockSellers[0],
    category: mockCategories[2],
    likes: 1000,
    comments: 89,
    timeAgo: '12 hours ago',
  ),
  Product(
    id: 'p2',
    title: 'Gaming Mouse – RGB Lighting',
    description: 'High precision gaming mouse with customizable RGB lighting. Perfect for FPS games. Excellent condition, rarely used.',
    price: 35.00,
    images: [
      'assets/images/products/gamingMouse.png',
      'assets/images/products/gamingMouse.png',
      'assets/images/products/gamingMouse.png',
    ],
    seller: mockSellers[1],
    category: mockCategories[2],
    likes: 856,
    comments: 42,
    timeAgo: '1 day ago',
  ),
  Product(
    id: 'p3',
    title: 'Mechanical Keyboard – Cherry MX',
    description: 'Full-size mechanical keyboard with Cherry MX Blue switches. Great for typing and gaming. Comes with original keycaps and extra set.',
    price: 75.00,
    images: [
      'assets/images/products/keyboard.png',
      'assets/images/products/keyboard.png',
      'assets/images/products/keyboard.png',
      'assets/images/products/keyboard.png',
    ],
    seller: mockSellers[2],
    category: mockCategories[2],
    likes: 2300,
    comments: 156,
    timeAgo: '2 days ago',
  ),
  Product(
    id: 'p4',
    title: 'Gaming Laptop – RTX Ready',
    description: 'Powerful gaming laptop with RTX graphics. Runs all AAA games smoothly. 16GB RAM, 512GB SSD. Minor scratches on lid but works perfectly.',
    price: 850.00,
    images: [
      'assets/images/products/gamingLaptop.png',
      'assets/images/products/gamingLaptop.png',
      'assets/images/products/gamingLaptop.png',
      'assets/images/products/gamingLaptop.png',
      'assets/images/products/gamingLaptop.png',
    ],
    seller: mockSellers[3],
    category: mockCategories[2],
    likes: 4500,
    comments: 312,
    timeAgo: '3 days ago',
  ),
  Product(
    id: 'p5',
    title: 'Portable Power Bank – 20000mAh',
    description: 'Large capacity power bank with fast charging support. Can charge phone 4-5 times. USB-C and USB-A ports available.',
    price: 25.00,
    images: [
      'assets/images/products/powerbank.png',
      'assets/images/products/powerbank.png',
    ],
    seller: mockSellers[4],
    category: mockCategories[2],
    likes: 678,
    comments: 28,
    timeAgo: '5 days ago',
  ),
  Product(
    id: 'p6',
    title: 'Smartphone – Like New',
    description: 'Latest model smartphone in excellent condition. Always used with screen protector and case. Includes original box and accessories.',
    price: 450.00,
    images: [
      'assets/images/products/smartPhone.png',
      'assets/images/products/smartPhone.png',
      'assets/images/products/smartPhone.png',
    ],
    seller: mockSellers[0],
    category: mockCategories[2],
    likes: 3200,
    comments: 245,
    timeAgo: '1 week ago',
  ),
  Product(
    id: 'p7',
    title: 'Tablet – Great for Students',
    description: 'Perfect tablet for note-taking and studying. Comes with stylus pen. Screen in perfect condition with no scratches.',
    price: 320.00,
    images: [
      'assets/images/products/tablet.png',
      'assets/images/products/tablet.png',
      'assets/images/products/tablet.png',
      'assets/images/products/tablet.png',
    ],
    seller: mockSellers[1],
    category: mockCategories[2],
    likes: 1890,
    comments: 134,
    timeAgo: '1 week ago',
  ),
  Product(
    id: 'p8',
    title: 'External SSD – 1TB Fast Storage',
    description: 'Super fast external SSD for backup and file transfer. USB 3.2 Gen 2 support. Compact and portable design.',
    price: 95.00,
    images: [
      'assets/images/products/externalSSD.png',
      'assets/images/products/externalSSD.png',
    ],
    seller: mockSellers[2],
    category: mockCategories[2],
    likes: 567,
    comments: 45,
    timeAgo: '2 weeks ago',
  ),
  Product(
    id: 'p9',
    title: 'Light Green Backpack – Stylish',
    description: 'Trendy light green backpack perfect for campus. Multiple compartments for laptop and books. Water-resistant material.',
    price: 40.00,
    images: [
      'assets/images/products/lightGreenBackpack.png',
      'assets/images/products/lightGreenBackpack.png',
      'assets/images/products/lightGreenBackpack.png',
    ],
    seller: mockSellers[3],
    category: mockCategories[3],
    likes: 1234,
    comments: 89,
    timeAgo: '3 weeks ago',
  ),
  Product(
    id: 'p10',
    title: 'Electric Kettle – Quick Boil',
    description: 'Compact electric kettle perfect for dorm room. Boils water in minutes. Auto shut-off feature for safety.',
    price: 20.00,
    images: [
      'assets/images/products/ElectricKettle.png',
      'assets/images/products/ElectricKettle.png',
    ],
    seller: mockSellers[4],
    category: mockCategories[2],
    likes: 445,
    comments: 23,
    timeAgo: '1 month ago',
  ),
];