import 'package:flutter/material.dart';

class MarketplaceAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int chatBadgeCount;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onChatTap;

  const MarketplaceAppBar({
    super.key,
    this.chatBadgeCount = 0,
    this.onFavoriteTap,
    this.onChatTap,
  });

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
        Stack(
          children: [
            IconButton(
              onPressed: onChatTap,
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
                size: 26,
              ),
            ),
            if (chatBadgeCount > 0)
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    chatBadgeCount > 99 ? '99+' : chatBadgeCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
