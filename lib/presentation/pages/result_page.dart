import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk_diamonds_group_app/application/result/result_cubit.dart';
import 'package:kgk_diamonds_group_app/application/result/result_state.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_colors.dart';
import 'package:kgk_diamonds_group_app/core/constants/app_strings.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_styles.dart';
import 'package:kgk_diamonds_group_app/domain/diamond_facade.dart';
import 'package:kgk_diamonds_group_app/presentation/widgets/diamond_grid.dart';
import 'package:kgk_diamonds_group_app/presentation/widgets/sort_dropdown.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late DiamondFacade diamondFacade;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    diamondFacade = DiamondFacade.initialize(context);
    diamondFacade.applyFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(wRes(16.0)),
          child: Text(
            AppStrings.sortByTitle,
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.textLight),
          ),
        ),
        SortDropdown(diamondFacade: diamondFacade),
        Expanded(child: getDiamondList()),
      ],
    );
  }

  Widget getDiamondList() {
    return BlocBuilder<ResultCubit, ResultState>(
      builder: (context, state) {
        if (state is ResultLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ResultError) {
          return Center(
              child: Text(state.message,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppColors.textLight)));
        } else if (state is ResultLoaded) {
          if (state.diamonds.isEmpty) {
            return Center(
                child: Text(AppStrings.noDiamondsTitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: AppColors.textLight)));
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: wRes(20), vertical: hRes(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${AppStrings.totalDiamondsTitle} (${state.diamonds.length})',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.textLight)),
                Expanded(
                    child: DiamondGrid(diamonds: state.diamonds, diamondFacade: diamondFacade)),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
