import 'package:flutter/material.dart';
import '../../../data/repositories/community_repository.dart';
import '../../../data/repositories/student_repository.dart';
import '../../../models/community_post.dart';
import '../../../models/student.dart';
import '../../../utils/constants/colors.dart';
import '../../widgets/common/user_widgets.dart';
import '../../widgets/community/community_post_card.dart';
import '../../widgets/community/post_composer.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final CommunityRepository _communityRepository = CommunityRepositoryImpl();
  final StudentRepository _studentRepository = StudentRepositoryImpl();
  late final List<CommunityPost> _posts;
  late final List<Student> _friends;
  final Set<String> _likedPosts = {};
  final Set<String> _followingStudents = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _posts = _communityRepository.getPosts();
    _friends = _studentRepository.getStudents();
  }

  @override
  void dispose() {
    _tabController.dispose();
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
              _buildCommunityTab(),
              _buildFriendsTab(),
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
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: AppColors.primary,
        unselectedLabelColor: Colors.grey.shade500,
        indicatorColor: AppColors.primary,
        indicatorWeight: 3,
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        tabs: const [
          Tab(text: 'Community @cadt'),
          Tab(text: 'Friends'),
        ],
      ),
    );
  }

  Widget _buildCommunityTab() {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      itemBuilder: (context, index) {
        if (index == 0) {
          return const PostComposer();
        }

        final post = _posts[index - 1];
        return CommunityPostCard(
          post: post,
          isLiked: _likedPosts.contains(post.id),
          onLikeTap: () {
            setState(() {
              if (_likedPosts.contains(post.id)) {
                _likedPosts.remove(post.id);
              } else {
                _likedPosts.add(post.id);
              }
            });
          },
        );
      },
      itemCount: _posts.length + 1,
    );
  }

  Widget _buildFriendsTab() {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      itemCount: _friends.length,
      itemBuilder: (context, index) {
        final student = _friends[index];
        return StudentListTile(
          student: student,
          isFollowing: _followingStudents.contains(student.id),
          onFollowTap: () {
            setState(() {
              if (_followingStudents.contains(student.id)) {
                _followingStudents.remove(student.id);
              } else {
                _followingStudents.add(student.id);
              }
            });
          },
          onTap: () {},
        );
      },
    );
  }
}
