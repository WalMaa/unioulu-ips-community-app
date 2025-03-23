import 'package:community/features/community/presentation/pages/single_community_post_page.dart';
import 'package:flutter/material.dart';

import '../../data/models/post_model.dart';

class CommunityPostCard extends StatelessWidget {
  final PostModel post; // Pass the PostModel

  const CommunityPostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print(post.id);
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
          borderRadius: BorderRadius.circular(16),
        ),
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
                    color: Colors.grey[600],
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                children: [
                  IconButton(
                  icon: const Icon(Icons.thumb_up),
                  onPressed: () {
                    // Handle like button press
                  },
                  ),
                  Text('${0}'),
                ],
                ),
                Row(
                children: [
                  IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {
                    // Handle comment button press
                  },
                  ),
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
