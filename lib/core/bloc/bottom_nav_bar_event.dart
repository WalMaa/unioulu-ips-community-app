part of 'bottom_nav_bar_bloc.dart';

sealed class BottomNavBarEvent extends Equatable {
  const BottomNavBarEvent();

  @override
  List<Object> get props => [];
}

class SelectTabEvent extends BottomNavBarEvent {
  final int index;

  const SelectTabEvent(this.index);

  @override
  List<Object> get props => [index];
}
