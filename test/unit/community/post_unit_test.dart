import 'package:community/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:community/features/community/data/models/post_model.dart';
import 'package:community/features/community/presentation/bloc/community_bloc.dart';
import 'package:community/features/community/service/community_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_unit_test.mocks.dart';


@GenerateNiceMocks([
  MockSpec<CommunityService>(),
  MockSpec<AuthRepositoryImpl>(),
])
void main() {
  late CommunityBloc communityBloc;
  late MockAuthRepositoryImpl authRepository;
  late MockCommunityService communityService;

  setUp(() {
    authRepository = MockAuthRepositoryImpl();
    communityService = MockCommunityService();
    communityBloc = CommunityBloc(
        communityService: communityService,
        authRepository: authRepository);
  });

  tearDown(() {
    communityBloc.close();
  });

  test('initial state should be CommunityInitial', () {
    expect(communityBloc.state, isA<CommunityInitial>());
  });

  test(
      'when FetchCommunityPosts, emits CommunityLoading, CommunityLoaded with posts',
      () async {
    // Arrange
    final posts = [
      PostModel(
          id: '1',
          authorName: 'Test',
          content: 'Test content',
          authorTitle: '',
          postTitle: '',
          pollQuestion: '',
          imageUrl: '')
    ];

    when(communityService.getPosts(limit: 50, sortByLatest: true))
        .thenAnswer((_) async => posts);
    
    

    // Act
    communityBloc.add(FetchCommunityPosts());

    // Assert
    expectLater(
      communityBloc.stream,
      emitsInOrder([
        isA<CommunityLoading>(),
        isA<CommunityLoaded>()
            .having((state) => state.posts, 'posts', posts),
      ]),
    );
  });

  test('when FetchCommunityPosts fail, emits CommunityLoading, CommunityError if getPosts fails',
      () async {
    // Arrange
    when(communityService.getPosts(limit: 50, sortByLatest: true)).thenThrow(Exception('Error'));

    // Act
    communityBloc.add(FetchCommunityPosts());

    // Assert
    expectLater(
      communityBloc.stream,
      emitsInOrder([
        isA<CommunityLoading>(),
        isA<CommunityError>(),
      ]),
    );
  });
}
