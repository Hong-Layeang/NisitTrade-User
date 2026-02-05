import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../models/student.dart';

class StudentListTile extends StatelessWidget {
  final Student student;
  final bool isFollowing;
  final VoidCallback? onTap;
  final VoidCallback? onFollowTap;

  const StudentListTile({
    super.key,
    required this.student,
    this.isFollowing = false,
    this.onTap,
    this.onFollowTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade100,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            UserAvatar(
              imageUrl: student.avatarUrl,
              radius: 28,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    student.username,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            FollowButton(
              isFollowing: isFollowing,
              onTap: onFollowTap,
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable user avatar with error handling
class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final IconData fallbackIcon;

  const UserAvatar({
    super.key,
    required this.imageUrl,
    this.radius = 24,
    this.fallbackIcon = Icons.person,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey.shade200,
      backgroundImage: NetworkImage(imageUrl),
      onBackgroundImageError: (exception, stackTrace) {},
      child: Icon(
        fallbackIcon,
        color: Colors.grey.shade400,
        size: radius,
      ),
    );
  }
}

/// Reusable follow/add person button
class FollowButton extends StatelessWidget {
  final bool isFollowing;
  final VoidCallback? onTap;

  const FollowButton({
    super.key,
    this.isFollowing = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isFollowing
              ? AppColors.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          isFollowing ? Icons.person : Icons.person_add_outlined,
          color: isFollowing ? AppColors.primary : Colors.grey.shade400,
          size: 24,
        ),
      ),
    );
  }
}
