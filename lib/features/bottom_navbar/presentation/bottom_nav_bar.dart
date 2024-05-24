import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper_widgets/custom_image_widget.dart';
import '../../../core/theme/colors.dart';
import '../cubit/bottom_navbar_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarCubit, BottomNavbarState>(
      builder: (context, state) {
        final cubit = context.read<BottomNavbarCubit>();
        final icons = cubit.icons;
        return Scaffold(
          body: cubit.pages[state.index],
          extendBody: true,
          bottomNavigationBar: DotNavigationBar(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
            marginR: EdgeInsets.zero,
            paddingR: EdgeInsets.zero,
            enableFloatingNavBar: false,
            dotIndicatorColor: ColorsManger.neutralColor00,
            backgroundColor: ColorsManger.neutralColor00,
            // selectedItemColor: ColorsManger.primaryColor500,
            itemPadding: EdgeInsets.symmetric(horizontal: 12.w),
            splashColor: ColorsManger.neutralColor00,
            currentIndex: state.index,
            onTap: (int index) {
              cubit.changeIndex(index);
            },
            items: icons
                .map((icon) => _buildItem(
                      icon: icon,
                      isSelected: state.index == icons.indexOf(icon),
                    ))
                .toList(),
          ),
        );
      },
    );
  }

  DotNavigationBarItem _buildItem({
    required String icon,
    bool isSelected = false,
  }) {
    return DotNavigationBarItem(
      icon: CustomSvgImage(
        imageName: icon,
        width: 30.w,
        height: 30.h,
        color: isSelected
            ? ColorsManger.primaryColor500
            : ColorsManger.neutralColor100,
      ),
    );
  }
}
