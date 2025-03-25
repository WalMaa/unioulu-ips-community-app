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
  })  : _communityService = communityService,
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
    // Only proceed if we're in the loaded state
    if (state is CommunityLoaded) {
      final currentState = state as CommunityLoaded;

      try {
        // Get current user ID
        final userId = await _authRepository.getCurrentUserId();

        // Check if user is anonymous
        if (userId == 'anonymous') {
          // Show error that anonymous users can't like
          emit(CommunityError(message: 'Please log in to like posts'));
          // Go back to the current state
          emit(currentState);
          return;
        }

        // Find the post that needs to be updated
        final postIndex =
            currentState.posts.indexWhere((p) => p.id == event.postId);
        if (postIndex == -1) {
          // Post not found
          emit(CommunityError(message: 'Post not found'));
          emit(currentState);
          return;
        }

        final post = currentState.posts[postIndex];
        final isLiked = post.isLiked;

        // Create a new posts list with the updated post
        final updatedPosts = List<PostModel>.from(currentState.posts);
        updatedPosts[postIndex] = post.copyWith(
          isLiked: !isLiked,
          likeCount: post.likeCount +
              (isLiked ? -1 : 1), // Decrement if unliking, increment if liking
        );

        // Create a new set of liked post IDs
        final updatedLikedPosts = Set<String>.from(currentState.likedPosts);
        if (isLiked) {
          // Removing the like
          updatedLikedPosts.remove(event.postId);
        } else {
          // Adding the like
          updatedLikedPosts.add(event.postId);
        }

        // Emit updated state BEFORE making API call (optimistic update)
        emit(CommunityLoaded(
          posts: updatedPosts,
          likedPosts: updatedLikedPosts,
        ));

        // Call the appropriate service method
        if (isLiked) {
          await _communityService.unlikePost(userId, event.postId);
        } else {
          await _communityService.likePost(userId, event.postId);
        }

        // Optionally emit a success notification state
        emit(CommunityActionSuccess(
          message: isLiked ? 'Post unliked' : 'Post liked',
          postId: event.postId,
        ));

        // Return to the updated state (this is important)
        emit(CommunityLoaded(
          posts: updatedPosts,
          likedPosts: updatedLikedPosts,
        ));
      } catch (e) {
        // Log the error
        developer.log('Error toggling like: ${e.toString()}');

        // Emit error state
        emit(CommunityError(message: 'Failed to update like: ${e.toString()}'));

        // Revert to the previous state
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
