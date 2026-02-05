import '../../models/community_post.dart';
import '../mock/mock_data.dart';

abstract class CommunityRepository {
  List<CommunityPost> getPosts();
}

class CommunityRepositoryImpl implements CommunityRepository {
  @override
  List<CommunityPost> getPosts() {
    return mockCommunityPosts;
  }
}
