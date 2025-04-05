part of 'community_bloc.dart';

abstract class CommunityEvent extends Equatable {
  const CommunityEvent();

  @override
  List<Object> get props => [];
}

class LoadSinglePost extends CommunityEvent {
  final PostModel post;
  
  const LoadSinglePost({required this.post});
  
  @override
  List<Object> get props => [post];
}

class AddComment extends CommunityEvent {
  final String postId;
  final String commentText;
  
  const AddComment({
    required this.postId,
    required this.commentText,
  });
  
  @override
  List<Object> get props => [postId, commentText];
}

class LoadComments extends CommunityEvent {
  final String postId;
  
  const LoadComments({required this.postId});
  
  @override
  List<Object> get props => [postId];
}