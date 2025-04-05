import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../../../core/services/http_appwrite_service.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../data/models/comment_model.dart';
import '../../data/models/post_model.dart';
import 'package:get_it/get_it.dart';

class SingleCommunityPostPage extends StatefulWidget {
  const SingleCommunityPostPage({
    super.key,
    required this.post, // Pass PostModel object
  });

  final PostModel post;

  @override
  _SingleCommunityPostPageState createState() =>
      _SingleCommunityPostPageState();
}

class _SingleCommunityPostPageState extends State<SingleCommunityPostPage> {
  final TextEditingController _commentController = TextEditingController();
  late List<CommentModel> _comments = [];
  int? _selectedPollOption;

  // Function to fetch comments for the post
  Future<void> _fetchComments() async {
    print(widget.post.id);
    final appwriteService = AppwriteService();

    final response = await appwriteService.listDocuments(
      collectionId: "comments",
    );

    final List<dynamic> jsonData = response['documents'];
    setState(() {
      _comments = jsonData.map((json) => CommentModel.fromJson(json)).toList();
    });
  }

  // Function to add a comment
  void _addComment() async {
    if (_commentController.text.isNotEmpty) {
      final authState = context.read<AuthBloc>().state;
      final username =
          authState is AuthAuthenticated ? authState.user.name : 'Anonymous';

      final newComment = CommentModel(
        text: _commentController.text,
        username: username,
        dateTime: DateTime.now(),
        postId: widget.post.id, // Add this line
      );

      final appwriteService = AppwriteService();
      final response = await appwriteService.createDocument(
        collectionId: "comments",
        documentId: 'unique()',
        data: {
          'documentId': 'unique()',
          'data': newComment.toJson(),
        },
      );

      if (response.isNotEmpty) {
        setState(() {
          _comments.add(newComment);
        });
        _commentController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add comment')),
        );
      }
    }
  }

  // // Function to handle vote selection
  // Future<void> _voteOnPoll(int optionIndex) async {
  //   setState(() {
  //     _selectedPollOption = optionIndex;
  //   });

  //   // Handle the vote submission logic here (e.g., sending data to Appwrite or updating the local post object)
  //   // ✅ Save vote to backend (e.g., Appwrite)
  //   final appwriteService = GetIt.instance<AppwriteService>();
  //   await appwriteService.updateDocument(
  //     collectionId: 'posts', // or your actual post collection ID
  //     documentId: widget.post.id,
  //     data: widget.post.toJson(), // Send updated post with incremented votes
  //   );
  // }

  void _voteOnPoll(int optionIndex) async {
    setState(() {
      // Update the selected poll option
      _selectedPollOption = optionIndex;
      // Increment the vote count for the selected option
      widget.post.pollOptions![optionIndex].votes++;
    });

    // Handle the vote submission logic here (e.g., sending data to Appwrite or updating the local post object)
    final appwriteService = GetIt.instance<AppwriteService>();
    await appwriteService.updateDocument(
      collectionId: 'posts', // or your actual post collection ID
      documentId: widget.post.id,
      data: widget.post.toJson(), // Send updated post with incremented votes
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchComments(); // Fetch comments when the page loads
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Post'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Post Section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.all(12),
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
                          // Replaced via.placeholder.com with dummyimage.com
                          backgroundImage:
                              NetworkImage('https://dummyimage.com/150x150/000/fff'),
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
                              Text(
                                post.authorTitle,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (post.imageUrl.isNotEmpty)
                      Image.network(
                        post.imageUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
                        },
                      )
                    else
                      Image.asset(
                        'assets/default_avatar.png', // make sure this exists in pubspec.yaml
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),

                    const SizedBox(height: 16),
                    Text(
                      post.postTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      post.content,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Poll Section (if exists)
          if (post.pollOptions != null && post.pollOptions!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ Show the poll question from the post
                  Text(
                    post.pollQuestion,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // ✅ Show the poll options
                  ...List.generate(post.pollOptions!.length, (index) {
                    return RadioListTile<int>(
                              title: Text(
                                '${post.pollOptions![index].option} (${post.pollOptions![index].votes} votes)',
                              ),
                              value: index,
                              groupValue: _selectedPollOption,
                              onChanged: (value) {
                                _voteOnPoll(value!);
                              },
                    );
                  }),
                ],
              ),
            ),

            const SizedBox(height: 16),
            // Comment Input Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 100, // Adjust as needed
                      child: TextFormField(
                        controller: _commentController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: "Add a comment...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _addComment,
                    child: const Text('Post'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Comment Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Comments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                final comment = _comments[index];
                return ListTile(
                  leading: const CircleAvatar(
                    // Replaced via.placeholder.com with dummyimage.com
                    backgroundImage:
                        NetworkImage('https://dummyimage.com/150x150/000/fff'),
                  ),
                  title: Row(
                    children: [
                      Text(comment.username),
                      const Spacer(),
                      Text(
                        _formatDateTime(comment.dateTime),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(comment.text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

String _formatDateTime(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inSeconds < 60) {
    return 'just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} days ago';
  } else {
    return '${dateTime.month}/${dateTime.day}/${dateTime.year}';
  }
}


























// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../features/auth/presentation/bloc/auth_bloc.dart';
// import '../../../../core/services/http_appwrite_service.dart';
// import '../../../auth/presentation/bloc/auth_state.dart';
// import '../../data/models/comment_model.dart';
// import '../../data/models/post_model.dart';

// class SingleCommunityPostPage extends StatefulWidget {
//   const SingleCommunityPostPage({
//     super.key,
//     required this.post, // Pass PostModel object
//   });

//   final PostModel post;

//   @override
//   _SingleCommunityPostPageState createState() =>
//       _SingleCommunityPostPageState();
// }

// class _SingleCommunityPostPageState extends State<SingleCommunityPostPage> {
//   final TextEditingController _commentController = TextEditingController();
//   late List<CommentModel> _comments = [];
//   int? _selectedPollOption;

//   // Function to fetch comments for the post
//   Future<void> _fetchComments() async {
//     print(widget.post.id);
//     final appwriteService = AppwriteService();

//     final response = await appwriteService.listDocuments(
//       collectionId: "comments",
//     );

//     final List<dynamic> jsonData = response['documents'];
//     setState(() {
//       _comments = jsonData.map((json) => CommentModel.fromJson(json)).toList();
//     });
//   }

//   // Function to add a comment
//   void _addComment() async {
//     if (_commentController.text.isNotEmpty) {
//       final authState = context.read<AuthBloc>().state;
//       final username =
//           authState is AuthAuthenticated ? authState.user.name : 'Anonymous';

//       final newComment = CommentModel(
//         text: _commentController.text,
//         username: username,
//         dateTime: DateTime.now(),
//         postId: widget.post.id, // Add this line
//       );

//       final appwriteService = AppwriteService();
//       final response = await appwriteService.createDocument(
//         collectionId: "comments",
//         documentId: 'unique()',
//         data: {
//           'documentId': 'unique()',
//           'data': newComment.toJson(),
//         },
//       );

//       if (response.isNotEmpty) {
//         setState(() {
//           _comments.add(newComment);
//         });
//         _commentController.clear();
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Failed to add comment')),
//         );
//       }
//     }
//   }

//   // Function to handle vote selection
//   void _voteOnPoll(int optionIndex) {
//     setState(() {
//       _selectedPollOption = optionIndex;
//     });

//     // Handle the vote submission logic here (e.g., sending data to Appwrite or updating the local post object)
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fetchComments(); // Fetch comments when the page loads
//   }

//   @override
//   Widget build(BuildContext context) {
//     final post = widget.post;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Community Post'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Main Post Section
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               margin: const EdgeInsets.all(12),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const CircleAvatar(
//                           radius: 28,
//                           // Replaced via.placeholder.com with dummyimage.com
//                           backgroundImage:
//                               NetworkImage('https://dummyimage.com/150x150/000/fff'),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 post.authorName,
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 post.authorTitle,
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey[600],
//                                 ),
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     if (post.imageUrl.isNotEmpty)
//                       Image.network(
//                         post.imageUrl,
//                         width: double.infinity,
//                         height: 200,
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) {
//                           return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
//                         },
//                       )
//                     else
//                       Image.asset(
//                         'assets/default_avatar.png', // make sure this exists in pubspec.yaml
//                         width: double.infinity,
//                         height: 200,
//                         fit: BoxFit.cover,
//                       ),

//                     const SizedBox(height: 16),
//                     Text(
//                       post.postTitle,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       post.content,
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             // Poll Section (if exists)
//             if (post.pollOptions != null && post.pollOptions!.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Poll:',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     ...List.generate(post.pollOptions!.length, (index) {
//                       return RadioListTile<int>(
//                         title: Text(post.pollOptions![index].option),
//                         value: index,
//                         groupValue: _selectedPollOption,
//                         onChanged: (value) {
//                           _voteOnPoll(value!);
//                         },
//                       );
//                     }),
//                   ],
//                 ),
//               ),
//             const SizedBox(height: 16),
//             // Comment Input Field
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: SizedBox(
//                       height: 100, // Adjust as needed
//                       child: TextFormField(
//                         controller: _commentController,
//                         maxLines: 3,
//                         decoration: InputDecoration(
//                           hintText: "Add a comment...",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   ElevatedButton(
//                     onPressed: _addComment,
//                     child: const Text('Post'),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             // Comment Section
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Comments',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 8),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: _comments.length,
//               itemBuilder: (context, index) {
//                 final comment = _comments[index];
//                 return ListTile(
//                   leading: const CircleAvatar(
//                     // Replaced via.placeholder.com with dummyimage.com
//                     backgroundImage:
//                         NetworkImage('https://dummyimage.com/150x150/000/fff'),
//                   ),
//                   title: Row(
//                     children: [
//                       Text(comment.username),
//                       const Spacer(),
//                       Text(
//                         _formatDateTime(comment.dateTime),
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                   subtitle: Text(comment.text),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// String _formatDateTime(DateTime dateTime) {
//   final now = DateTime.now();
//   final difference = now.difference(dateTime);

//   if (difference.inSeconds < 60) {
//     return 'just now';
//   } else if (difference.inMinutes < 60) {
//     return '${difference.inMinutes} minutes ago';
//   } else if (difference.inHours < 24) {
//     return '${difference.inHours} hours ago';
//   } else if (difference.inDays < 7) {
//     return '${difference.inDays} days ago';
//   } else {
//     return '${dateTime.month}/${dateTime.day}/${dateTime.year}';
//   }
// }