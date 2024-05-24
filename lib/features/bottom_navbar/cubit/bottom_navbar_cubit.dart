import 'package:cookly/core/constants/images_constants.dart';
import 'package:cookly/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_navbar_state.dart';
part 'bottom_navbar_cubit.freezed.dart';

class BottomNavbarCubit extends Cubit<BottomNavbarState> {
  BottomNavbarCubit() : super(const BottomNavbarState.initial(index: 0));

  final List icons = [
    ImagesConstants.compass,
    ImagesConstants.favorites,
    ImagesConstants.receipt,
    ImagesConstants.user,
  ];

  void changeIndex(int index) {
    emit(BottomNavbarState.currentIndex(index));
  }

  void resetIndex() {
    emit(const BottomNavbarState.initial(index: 0));
  }

  final List pages = [
    HomeScreen(),
    const Text('Likes'),
    const Text('Search'),
    const Text('Profile'),
  ];
}
