import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/community/presentation/pages/community_page.dart';
import '../../features/events/presentation/pages/event_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/more/presentation/pages/more_page.dart';
import '../bloc/bottom_nav_bar_bloc.dart';

class MainPage extends StatelessWidget {
  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const EventsPage(),
    const CommunityPage(),
    const MorePage(),
  ];

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarBloc(),
      child: Scaffold(
        body: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
          builder: (context, state) {
            int selectedIndex = 0;
            if (state is TabSelectedState) {
              selectedIndex = state.selectedIndex;
            }
            return _pages[selectedIndex];
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
          builder: (context, state) {
            int selectedIndex = 0;
            if (state is TabSelectedState) {
              selectedIndex = state.selectedIndex;
            }
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.event),
                  label: 'Event',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group),
                  label: 'Community',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz),
                  label: 'More',
                ),
              ],
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              currentIndex: selectedIndex,
              backgroundColor: Theme.of(context).primaryColor,
              selectedItemColor: Theme.of(context).scaffoldBackgroundColor,
              unselectedItemColor:
                  Theme.of(context).textTheme.headlineSmall!.color,
              onTap: (index) {
                context.read<BottomNavBarBloc>().add(SelectTabEvent(index));
              },
            );
          },
        ),
      ),
    );
  }
}
