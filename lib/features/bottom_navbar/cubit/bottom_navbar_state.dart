part of 'bottom_navbar_cubit.dart';

@freezed
class BottomNavbarState with _$BottomNavbarState {
  const factory BottomNavbarState.initial({required int index}) = _Initial;
  const factory BottomNavbarState.currentIndex(int index) = _CurrentIndex;
}
