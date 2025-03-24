import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:community/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:community/features/community/data/models/post_model.dart';
import 'package:community/features/community/service/community_service.dart';
import 'package:equatable/equatable.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  final CommunityService _communityService;
  final AuthRepositoryImpl _authRepository;

  CommunityBloc({
    required CommunityService communityService,
    required AuthRepositoryImpl authRepository,
  }) : _communityService = communityService,
       _authRepository = authRepository,
       super(CommunityInitial()) {
    on<FetchCommunityPosts>(_onFetchCommunityPosts);
    on<ToggleLike>(_onToggleLike);
  }

Future<void> _onFetchCommunityPosts(
    FetchCommunityPosts event, Emitter<CommunityState> emit) async {
  emit(CommunityLoading());

  try {
    // Get community posts from service
    final posts = await _communityService.getPosts();
    
    // Get current user ID
    final userId = await _authRepository.getCurrentUserId();
    
    // Get user's liked posts (if logged in)
    Set<String> likedPostIds = {};
    if (userId != 'anonymous') {
      // Get liked posts
      final likedPosts = await _communityService.getUserLikedPosts(userId);
      likedPostIds = likedPosts.map((post) => post.id).toSet();
      
      // Update post models with liked status
      for (int i = 0; i < posts.length; i++) {
        if (likedPostIds.contains(posts[i].id)) {
          posts[i] = posts[i].copyWith(isLiked: true);
        }
      }
    }

    emit(CommunityLoaded(
      posts: posts,
      likedPosts: likedPostIds,
    ));
  } catch (e) {
    emit(CommunityError(message: e.toString()));
  }
}
  
  Future<void> _onToggleLike(
    ToggleLike event, Emitter<CommunityState> emit) async {
  developer.log("ToggleLike: Toggling like for post: ${event.postId}");
  
  if (state is CommunityLoaded) {
    final currentState = state as CommunityLoaded;
    
    
    try {
      // Get current user ID from auth repository
      final userId = await _authRepository.getCurrentUserId();
      developer.log('Toggling like for post: ${event.postId}');
      
      // Find post in current state
      final post = currentState.posts.firstWhere(
        (post) => post.id == event.postId,
        orElse: () => throw Exception('Post not found'),
      );
      
      // 1. Update UI optimistically - show immediate feedback
      final updatedPosts = currentState.posts.map((p) {
        if (p.id == event.postId) {
          return p.copyWith(isLiked: !p.isLiked);
        }
        return p;
      }).toList();
      
      // Emit updated state immediately
      emit(CommunityLoaded(posts: updatedPosts));
      
      // 2. Call service method with await to catch errors
      await _communityService.likePost(userId, event.postId);
      
      // 3. Emit a success state that BlocListener can react to
      emit(CommunityActionSuccess(
        message: post.isLiked ? 'Post unliked' : 'Post liked',
      ));
      
      // 4. Return to the updated loaded state
      emit(CommunityLoaded(posts: updatedPosts));
      
    } catch (e) {
      developer.log('Error toggling like: ${e.toString()}');
      
      // 5. Emit error state for user feedback
      emit(CommunityError(message: 'Failed to update like: ${e.toString()}'));
      
      // 6. Return to previous state to maintain UI consistency
      emit(currentState);
    }
  }
}
  
}

class FetchCommunityPosts extends CommunityEvent {
  const FetchCommunityPosts();

  @override
  List<Object> get props => [];
}

class ToggleLike extends CommunityEvent {
  final String postId;

  const ToggleLike({required this.postId});

  @override
  List<Object> get props => [postId];
}