import 'dart:developer' as developer;

import 'package:community/core/theme/theme_constants.dart';
import 'package:community/features/community/presentation/bloc/community_bloc.dart';
import 'package:community/features/community/presentation/pages/single_community_post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import for CommunityBloc
import '../../data/models/post_model.dart';

class CommunityPostCard extends StatefulWidget {
  final PostModel post;

  const CommunityPostCard({
    super.key,
    required this.post,
  });

  @override
  CommunityPostCardState createState() => CommunityPostCardState();
}

class CommunityPostCardState extends State<CommunityPostCard> {
  late final PostModel post;

  @override
  void initState() {
    super.initState();
    post = widget.post;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleCommunityPostPage(
              post: post,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: AppRoundness.largeBorderRadius,
        ),
        color: Theme.of(context).cardColor,
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage:
                        NetworkImage('https://thispersondoesnotexist.com'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.authorName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          post.authorTitle,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                post.postTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                post.content,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {
                          developer.log('Like button pressed: ${post.id}');
                          // Handle like button press

                          context.read<CommunityBloc>().add(
                                ToggleLike(postId: post.id),
                              );
                        },
                      ),
                      Text('${0}'),
                    ],
                  ),
                  const SizedBox(width: AppSpacing.smallPadding),
                  Row(
                    children: [
                      const Icon(Icons.mode_comment_outlined),
                      const SizedBox(width: AppSpacing.smallPadding),
                      Text('${0}'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
