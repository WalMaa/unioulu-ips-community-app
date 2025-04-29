import 'package:community/core/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/services/http_appwrite_service.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../announcement/presentation/pages/announcement_page.dart';
import '../../../announcement/presentation/widgets/announcement_form.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../community/presentation/widgets/latest_community_posts_widget.dart';
import '../../../events/presentation/widgets/add_event_form.dart';
import '../../../language/presentation/bloc/language_bloc.dart';
import '../widgets/add_topic_form.dart';
import '../widgets/latest_event.dart';
import '../widgets/topic_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current locale from LocalizationBloc
    final currentLocale = context
        .select((LocalizationBloc bloc) => bloc.state.locale.languageCode);
    final appwriteService = GetIt.instance<AppwriteService>();

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          final isAdmin = state.labels.contains('admin');
          final isModerator = state.labels.contains('moderator');
          final isUser = state.labels.contains('user');

          if (isAdmin) {
            return _buildAdminScaffold(context, currentLocale, appwriteService);
          } else if (isModerator) {
            return _buildModeratorScaffold(
                context, currentLocale, appwriteService);
          } else if (isUser) {
            return _buildUserScaffold(
                context, currentLocale, appwriteService, state.user.name);
          }
        }

        // If not authenticated, show a default scaffold or login prompt
        return const Scaffold(
          body: Center(
            child: Text('Please log in to access the home page.'),
          ),
        );
      },
    );
  }

  Widget _buildAdminScaffold(BuildContext context, String currentLocale,
      AppwriteService appwriteService) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            // Custom tab bar without an AppBar
            Container(
              color: Theme.of(context).primaryColor,
              child: const TabBar(
                tabs: [
                  Tab(
                    text: 'Admin Dashboard',
                    icon: Icon(Icons.admin_panel_settings),
                  ),
                  Tab(text: 'User View', icon: Icon(Icons.person)),
                ],
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
              ),
            ),
            // Tab content
            Expanded(
              child: TabBarView(
                children: [
                  // Admin Dashboard Tab
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome, Admin',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const EventForm()),
                                );
                              },
                              child: const Text('Add New Event'),
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AddAnnouncementForm(),
                                  ),
                                );
                              },
                              text: 'Add New Announcement',
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const TopicForm()),
                                );
                              },
                              child: const Text('Add New Topic'),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to user management page
                              },
                              child: const Text('Manage Users'),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to content management page
                              },
                              child: const Text('Manage Content'),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Quick Stats',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            // Add some admin-specific stats or widgets here
                          ],
                        ),
                      ),
                    ),
                  ),

                  // User View Tab - Reuse the user scaffold content
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthAuthenticated) {
                        return _buildUserContentView(context, currentLocale,
                            appwriteService, state.user.name);
                      }
                      return const Center(child: Text('Authentication error'));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModeratorScaffold(BuildContext context, String currentLocale,
      AppwriteService appwriteService) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Community App'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Moderator Tools', icon: Icon(Icons.shield)),
              Tab(text: 'User View', icon: Icon(Icons.person)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Moderator Dashboard Tab
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome, Moderator',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EventForm()),
                          );
                        },
                        child: const Text('Add New Event'),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to content management page
                        },
                        child: const Text('Manage Content'),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Quick Stats',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      // Add some moderator-specific stats or widgets here
                    ],
                  ),
                ),
              ),
            ),

            // User View Tab - Reuse the user scaffold content
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthAuthenticated) {
                  return _buildUserContentView(
                      context, currentLocale, appwriteService, state.user.name);
                }
                return const Center(child: Text('Authentication error'));
              },
            ),
          ],
        ),
      ),
    );
  }

// Extract the user scaffold content into its own method
  Widget _buildUserContentView(BuildContext context, String currentLocale,
      AppwriteService appwriteService, String userName) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.smallPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Hello,', style: TextStyle(fontSize: 24.0)),
                        Text(
                          userName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        const Text(
                          'Let\'s explore what\'s new...',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Center(
              child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AnnouncementsPage(),
                      ),
                    );
                  },
                  text: 'Announcements'),
            ),
            const SizedBox(height: 10.0),
            TopicListWidget(
              currentLocale: currentLocale,
              appwriteService: appwriteService,
            ),
            const SizedBox(height: 10.0),
            const LatestEventsWidget(),
            const SizedBox(height: 10.0),
            const LatestCommunityPostsWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserScaffold(BuildContext context, String currentLocale,
      AppwriteService appwriteService, String userName) {
    return Scaffold(
      body: _buildUserContentView(
          context, currentLocale, appwriteService, userName),
    );
  }
}
