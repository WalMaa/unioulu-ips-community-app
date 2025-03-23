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

      emit(CommunityLoaded(posts: posts));
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

        _communityService.likePost(userId, event.postId);

      } catch (e) {
        emit(CommunityError(message: e.toString()));
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