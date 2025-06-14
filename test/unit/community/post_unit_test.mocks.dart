// Mocks generated by Mockito 5.4.4 from annotations
// in community/test/unit/community/post_unit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:community/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i3;
import 'package:community/features/auth/data/repositories/auth_repository_impl.dart'
    as _i9;
import 'package:community/features/auth/domain/entities/user.dart' as _i5;
import 'package:community/features/community/data/models/comment_model.dart'
    as _i2;
import 'package:community/features/community/data/models/post_model.dart'
    as _i8;
import 'package:community/features/community/service/community_service.dart'
    as _i6;
import 'package:isar/isar.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCommentModel_0 extends _i1.SmartFake implements _i2.CommentModel {
  _FakeCommentModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthRemoteDataSource_1 extends _i1.SmartFake
    implements _i3.AuthRemoteDataSource {
  _FakeAuthRemoteDataSource_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIsar_2 extends _i1.SmartFake implements _i4.Isar {
  _FakeIsar_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUser_3 extends _i1.SmartFake implements _i5.User {
  _FakeUser_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CommunityService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCommunityService extends _i1.Mock implements _i6.CommunityService {
  @override
  _i7.Future<void> voteOnPoll(
    String? postId,
    int? optionIndex,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #voteOnPoll,
          [
            postId,
            optionIndex,
          ],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<List<dynamic>> getUserLikedCommentIds(String? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserLikedCommentIds,
          [userId],
        ),
        returnValue: _i7.Future<List<dynamic>>.value(<dynamic>[]),
        returnValueForMissingStub: _i7.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i7.Future<List<dynamic>>);

  @override
  _i7.Future<List<_i8.PostModel>> getPosts({
    int? limit = 50,
    bool? sortByLatest = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPosts,
          [],
          {
            #limit: limit,
            #sortByLatest: sortByLatest,
          },
        ),
        returnValue: _i7.Future<List<_i8.PostModel>>.value(<_i8.PostModel>[]),
        returnValueForMissingStub:
            _i7.Future<List<_i8.PostModel>>.value(<_i8.PostModel>[]),
      ) as _i7.Future<List<_i8.PostModel>>);

  @override
  _i7.Future<_i2.CommentModel> addComment(
    String? postId,
    String? text,
    String? username,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addComment,
          [
            postId,
            text,
            username,
          ],
        ),
        returnValue: _i7.Future<_i2.CommentModel>.value(_FakeCommentModel_0(
          this,
          Invocation.method(
            #addComment,
            [
              postId,
              text,
              username,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i2.CommentModel>.value(_FakeCommentModel_0(
          this,
          Invocation.method(
            #addComment,
            [
              postId,
              text,
              username,
            ],
          ),
        )),
      ) as _i7.Future<_i2.CommentModel>);

  @override
  _i7.Future<List<_i2.CommentModel>> getPostComments(String? postId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPostComments,
          [postId],
        ),
        returnValue:
            _i7.Future<List<_i2.CommentModel>>.value(<_i2.CommentModel>[]),
        returnValueForMissingStub:
            _i7.Future<List<_i2.CommentModel>>.value(<_i2.CommentModel>[]),
      ) as _i7.Future<List<_i2.CommentModel>>);

  @override
  _i7.Future<int> getPostLikeCount(String? postId) => (super.noSuchMethod(
        Invocation.method(
          #getPostLikeCount,
          [postId],
        ),
        returnValue: _i7.Future<int>.value(0),
        returnValueForMissingStub: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);

  @override
  _i7.Future<List<_i8.PostModel>> getUserLikedPosts(String? userId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserLikedPosts,
          [userId],
        ),
        returnValue: _i7.Future<List<_i8.PostModel>>.value(<_i8.PostModel>[]),
        returnValueForMissingStub:
            _i7.Future<List<_i8.PostModel>>.value(<_i8.PostModel>[]),
      ) as _i7.Future<List<_i8.PostModel>>);

  @override
  _i7.Future<Map<String, dynamic>> likeComment(
    String? userId,
    String? commentId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #likeComment,
          [
            userId,
            commentId,
          ],
        ),
        returnValue:
            _i7.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i7.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i7.Future<Map<String, dynamic>>);

  @override
  _i7.Future<Map<String, dynamic>> likePost(
    String? userId,
    String? postId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #likePost,
          [
            userId,
            postId,
          ],
        ),
        returnValue:
            _i7.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i7.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i7.Future<Map<String, dynamic>>);

  @override
  _i7.Future<void> unlikeComment(
    String? userId,
    String? commentId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #unlikeComment,
          [
            userId,
            commentId,
          ],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> unlikePost(
    String? userId,
    String? postId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #unlikePost,
          [
            userId,
            postId,
          ],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<Map<String, int>> getCommentLikeCounts(List<String>? commentIds) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCommentLikeCounts,
          [commentIds],
        ),
        returnValue: _i7.Future<Map<String, int>>.value(<String, int>{}),
        returnValueForMissingStub:
            _i7.Future<Map<String, int>>.value(<String, int>{}),
      ) as _i7.Future<Map<String, int>>);

  @override
  _i7.Future<Map<String, int>> getPostLikeCounts(List<String>? postIds) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPostLikeCounts,
          [postIds],
        ),
        returnValue: _i7.Future<Map<String, int>>.value(<String, int>{}),
        returnValueForMissingStub:
            _i7.Future<Map<String, int>>.value(<String, int>{}),
      ) as _i7.Future<Map<String, int>>);

  @override
  _i7.Future<List<_i8.PostModel>> getPostLikes(String? postId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPostLikes,
          [postId],
        ),
        returnValue: _i7.Future<List<_i8.PostModel>>.value(<_i8.PostModel>[]),
        returnValueForMissingStub:
            _i7.Future<List<_i8.PostModel>>.value(<_i8.PostModel>[]),
      ) as _i7.Future<List<_i8.PostModel>>);
}

/// A class which mocks [AuthRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepositoryImpl extends _i1.Mock
    implements _i9.AuthRepositoryImpl {
  @override
  _i3.AuthRemoteDataSource get remoteDataSource => (super.noSuchMethod(
        Invocation.getter(#remoteDataSource),
        returnValue: _FakeAuthRemoteDataSource_1(
          this,
          Invocation.getter(#remoteDataSource),
        ),
        returnValueForMissingStub: _FakeAuthRemoteDataSource_1(
          this,
          Invocation.getter(#remoteDataSource),
        ),
      ) as _i3.AuthRemoteDataSource);

  @override
  _i4.Isar get isar => (super.noSuchMethod(
        Invocation.getter(#isar),
        returnValue: _FakeIsar_2(
          this,
          Invocation.getter(#isar),
        ),
        returnValueForMissingStub: _FakeIsar_2(
          this,
          Invocation.getter(#isar),
        ),
      ) as _i4.Isar);

  @override
  _i7.Future<_i5.User> register(
    String? email,
    String? password,
    String? name,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [
            email,
            password,
            name,
          ],
        ),
        returnValue: _i7.Future<_i5.User>.value(_FakeUser_3(
          this,
          Invocation.method(
            #register,
            [
              email,
              password,
              name,
            ],
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.User>.value(_FakeUser_3(
          this,
          Invocation.method(
            #register,
            [
              email,
              password,
              name,
            ],
          ),
        )),
      ) as _i7.Future<_i5.User>);

  @override
  _i7.Future<_i5.User> login(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            password,
          ],
        ),
        returnValue: _i7.Future<_i5.User>.value(_FakeUser_3(
          this,
          Invocation.method(
            #login,
            [
              email,
              password,
            ],
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.User>.value(_FakeUser_3(
          this,
          Invocation.method(
            #login,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i7.Future<_i5.User>);

  @override
  _i7.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<_i5.User> authenticateAnonymous() => (super.noSuchMethod(
        Invocation.method(
          #authenticateAnonymous,
          [],
        ),
        returnValue: _i7.Future<_i5.User>.value(_FakeUser_3(
          this,
          Invocation.method(
            #authenticateAnonymous,
            [],
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.User>.value(_FakeUser_3(
          this,
          Invocation.method(
            #authenticateAnonymous,
            [],
          ),
        )),
      ) as _i7.Future<_i5.User>);

  @override
  _i7.Future<_i5.User> updateProfile(String? name) => (super.noSuchMethod(
        Invocation.method(
          #updateProfile,
          [name],
        ),
        returnValue: _i7.Future<_i5.User>.value(_FakeUser_3(
          this,
          Invocation.method(
            #updateProfile,
            [name],
          ),
        )),
        returnValueForMissingStub: _i7.Future<_i5.User>.value(_FakeUser_3(
          this,
          Invocation.method(
            #updateProfile,
            [name],
          ),
        )),
      ) as _i7.Future<_i5.User>);

  @override
  _i7.Future<void> resetPassword(String? email) => (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [email],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<String> getCurrentUserId() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentUserId,
          [],
        ),
        returnValue: _i7.Future<String>.value(_i10.dummyValue<String>(
          this,
          Invocation.method(
            #getCurrentUserId,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<String>.value(_i10.dummyValue<String>(
          this,
          Invocation.method(
            #getCurrentUserId,
            [],
          ),
        )),
      ) as _i7.Future<String>);

  @override
  _i7.Future<String> getCurrentUserName() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentUserName,
          [],
        ),
        returnValue: _i7.Future<String>.value(_i10.dummyValue<String>(
          this,
          Invocation.method(
            #getCurrentUserName,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<String>.value(_i10.dummyValue<String>(
          this,
          Invocation.method(
            #getCurrentUserName,
            [],
          ),
        )),
      ) as _i7.Future<String>);
}
