part of 'community_bloc.dart';

abstract class CommunityState extends Equatable {
  const CommunityState();  

  @override
  List<Object> get props => [];
}

class CommunityInitial extends CommunityState {}

class CommunityLoading extends CommunityState {}

class CommunityActionSuccess extends CommunityState {
  final String message;
  final String? postId; // Optional: to identify which post was affected

  const CommunityActionSuccess({
    required this.message,
    this.postId,
  });

  @override
  List<Object> get props => [message, if (postId != null) postId!];
}

class CommunityLoaded extends CommunityState {
  final List<PostModel> posts;
  final Set<String> likedPosts;

  const CommunityLoaded({required this.posts, this.likedPosts = const <String>{}});

  @override
  List<Object> get props => [posts, likedPosts];

  @override
  String toString() => 'CommunityLoaded(posts: ${posts.length}), likedPosts: ${likedPosts.length})';

  bool isPostLiked(String postId) => likedPosts.contains(postId);

  CommunityLoaded toggleLike(String postId) {
    final updatedLikedPosts = Set<String>.from(likedPosts);
    if (likedPosts.contains(postId)) {
      updatedLikedPosts.remove(postId);
    } else {
      updatedLikedPosts.add(postId);
    }

    return copyWith(likedPosts: updatedLikedPosts);
  }


  CommunityLoaded copyWith({
    List<PostModel>? posts,
    Set<String>? likedPosts,
  }) {
    return CommunityLoaded(
      posts: posts ?? this.posts,
      likedPosts: likedPosts ?? this.likedPosts,
    );
  }
}

class CommunityError extends CommunityState {
  final String message;

  const CommunityError({required this.message});

  @override
  List<Object> get props => [message];
}

// State when comments are loading
class CommentsLoading extends CommunityState {
  final PostModel post; // Keep the post data
  
  const CommentsLoading({required this.post});
  
  @override
  List<Object> get props => [post];
}

// State when comments are loaded
class PostLoaded extends CommunityState {
  final PostModel post;
  final List<CommentModel> comments;
  
  const PostLoaded({
    required this.post,
    required this.comments,
  });
  
  @override
  List<Object> get props => [post, comments];
}

// State after adding a comment
class CommentAdded extends CommunityState {
  final PostModel post;
  final List<CommentModel> comments;
  final String message;
  
  const CommentAdded({
    required this.post,
    required this.comments,
    required this.message,
  });
  
  @override
  List<Object> get props => [post, comments, message];
}