import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/constant/app_icons.dart';
import '../../../../core/theme/custom/custom_app_bar.dart';
import '../../../../core/theme/custom/custom_font_weight.dart';
import '../../cubit/mall_type_cubit.dart';
import 'widgets/svg_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (_, state) {
        return AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          color: state.theme.backgroundColor,
          child: AppBar(
            leading: SvgIconButton(
              icon: AppIcons.mainLogo,
              color: state.theme.logoColor,
              padding: 8,
            ),
            backgroundColor: Colors.transparent,
            title: AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: state.theme.containerColor,
              ),
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: SizedBox(
                height: 32,
                child: DefaultTabController(
                  length: MallType.values.length,
                  initialIndex: state.index,
                  child: TabBar(
                    tabs: List.generate(
                      MallType.values.length,
                      (index) => Tab(
                        child: Center(
                          child: Text(MallType.values[index].toName),
                        ),
                      ),
                    ),
                    indicator: BoxDecoration(
                      color: state.theme.indicatorColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(CustomAppBarTheme.tabBarRadius),
                      ),
                    ),
                    labelColor: state.theme.labelColor,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                    labelStyle: textTheme.labelLarge.bold,
                    unselectedLabelColor: state.theme.unselectedLabelColor,
                    unselectedLabelStyle: textTheme.labelLarge.regular,
                    splashBorderRadius: BorderRadius.all(
                      Radius.circular(CustomAppBarTheme.tabBarRadius),
                    ),
                    dividerColor: Colors.transparent,
                    onTap: (index) =>
                        context.read<MallTypeCubit>().changeIndex(index),
                    // isScrollable: false,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ),
              ),
            ),
            centerTitle: true,
            leadingWidth: 86,
            actions: [
              SvgIconButton(
                icon: AppIcons.location,
                color: state.theme.iconColor,
              ),
              SvgIconButton(icon: AppIcons.cart, color: state.theme.iconColor),
            ],
          ),
          duration: Duration(milliseconds: 300),
        );
      },
    );
  }
}
