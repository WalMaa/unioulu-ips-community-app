part of 'community_bloc.dart';

abstract class CommunityState extends Equatable {
  const CommunityState();  

  @override
  List<Object> get props => [];
}

class CommunityInitial extends CommunityState {}

class CommunityLoading extends CommunityState {}

class CommunityLoaded extends CommunityState {
  final List<Map<String, dynamic>> posts;

  const CommunityLoaded({required this.posts});

  @override
  List<Object> get props => [posts];

  @override
  String toString() => 'CommunityLoaded(posts: ${posts.length})';

  CommunityLoaded copyWith({
    List<Map<String, dynamic>>? posts,
  }) {
    return CommunityLoaded(
      posts: posts ?? this.posts,
    );
  }
}

class CommunityError extends CommunityState {
  final String message;

  const CommunityError({required this.message});

  @override
  List<Object> get props => [message];
}