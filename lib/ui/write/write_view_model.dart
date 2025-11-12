// 1. 상태 클래스 만들기
import 'package:flutter_blog_app/model/post.dart';
import 'package:flutter_blog_app/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WriteState {
  bool isWriting;
  WriteState(this.isWriting);
}

// 2. 뷰모델 만들기
class WriteViewModel extends AutoDisposeFamilyNotifier<WriteState, Post?> {
  @override
  WriteState build(Post? arg) {
    return WriteState(false);
  }

  Future<bool> insert({
    required String writer,
    required String title,
    required String content,
  }) async {
    final postRepository = PostRepository();

    state = WriteState(true);
    if (arg == null) {
      // 포스트 객체가 널이면 : 새로작성
      final result = await postRepository.insert(
        title: title,
        content: content,
        writer: writer,
        imageUrl: "https://picsum.photos/200/300",
      );
      await Future.delayed(Duration(milliseconds: 500));
      state = WriteState(false);
      return result;
    } else {
      // 널이 아니면 : 수정
      final result = await postRepository.update(
        id: arg!.id,
        title: title,
        content: content,
        writer: writer,
        imageUrl: "https://picsum.photos/200/300",
      );
      await Future.delayed(Duration(milliseconds: 500));
      state = WriteState(false);
      return result;
    }
  }
}


// 3. 뷰모델 관리자 만들기

final writeViewModelProvider = NotifierProvider.autoDispose.family<WriteViewModel, WriteState, Post?>(() {
 return WriteViewModel();
},
);