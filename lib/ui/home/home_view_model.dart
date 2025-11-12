
// 1. 상태클래스 만들기
// List<Post>

// 2. 뷰모델 만들기
import 'package:flutter_blog_app/model/post.dart';
import 'package:flutter_blog_app/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends Notifier<List<Post>> {
  @override
  List<Post> build() {
    getAllPosts();
    return [];
  }

  void getAllPosts() async {
    final postRepo = PostRepository();
    final posts = await postRepo.getAll();
    state = posts ?? [];
  }
}

// 3. 뷰모뎅 관리자 만들기
final homeViewModelProvider = NotifierProvider<HomeViewModel, List<Post>>(() {
  return HomeViewModel();
});