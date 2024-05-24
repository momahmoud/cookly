import 'package:cookly/features/home/cubit/home_cubit.dart';
import 'package:cookly/features/home/cubit/home_state.dart';
import 'package:cookly/features/home/presentation/widgets/home_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/theme/colors.dart';
import '../../../core/utils/spacing.dart';
import 'widgets/home_best_partners_widget.dart';
import 'widgets/home_categories_widget.dart';
import 'widgets/home_header_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh(BuildContext context) async {
    context.read<HomeCubit>().getCategories();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => WaterDropMaterialHeader(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      footerTriggerDistance: 30.0,
      child: SafeArea(
        top: false,
        bottom: false,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.isCategoriesLoading!
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: const HomeLoadingWidget(),
                  )
                : state.categoriesError!.isNotEmpty
                    ? Center(child: Text(state.categoriesError!))
                    : SmartRefresher(
                        onRefresh: () => _onRefresh(context),
                        onLoading: _onLoading,
                        controller: _refreshController,
                        enablePullDown: true,
                        enablePullUp: true,
                        child: CustomScrollView(
                          physics: const BouncingScrollPhysics(),
                          slivers: <Widget>[
                            const SliverToBoxAdapter(
                              child: HomeHeaderWidget(),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                color: ColorsManger.neutralColor20,
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Column(
                                  children: <Widget>[
                                    verticalSpacing(12),
                                    HomeCategoriesWidget(
                                      categories: state.categories!,
                                    ),
                                    verticalSpacing(12),
                                    HomeBestPartnersWidget(
                                        partners: state.bestPartners ?? []),
                                    verticalSpacing(12),
                                  ],
                                ),
                              ),
                            ),
                            // SliverToBoxAdapter(
                            //     child: Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 12.w),
                            //   child: const HomeFiltersTabBarWidget(),
                            // )),
                          ],
                        ),
                      );
          },
        ),
      ),
    );
  }
}
