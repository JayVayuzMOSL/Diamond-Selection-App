import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk_diamonds_group_app/application/filter/filter_cubit.dart';
import 'package:kgk_diamonds_group_app/application/filter/filter_state.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_colors.dart';
import 'package:kgk_diamonds_group_app/core/constants/app_constants.dart';
import 'package:kgk_diamonds_group_app/core/constants/app_strings.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_styles.dart';
import 'package:kgk_diamonds_group_app/domain/diamond_facade.dart';
import 'package:kgk_diamonds_group_app/presentation/widgets/carat_slider.dart';
import 'package:kgk_diamonds_group_app/presentation/widgets/selectable_tile_group.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final List<String> labList = ['GIA', 'IGI', 'HRD'];

  final List<String> shapeList = ['Round', 'Oval', 'Princess'];

  final List<String> colorList = ['D', 'E', 'F'];

  final List<String> clarityList = ['IF', 'VVS1', 'VVS2'];

  late DiamondFacade diamondFacade;

  @override
  void dispose() {
    diamondFacade.resetFilters();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    diamondFacade = DiamondFacade.initialize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.filterDiamondsTitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.textLight),
        ),
        backgroundColor: AppColors.greyLight,
      ),
      body: Padding(
        padding: EdgeInsets.all(wRes(16.0)),
        child: BlocBuilder<FilterCubit, FilterState>(builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CaratSlider(diamondFacade: diamondFacade),
                SizedBox(height: hRes(20)),
                SelectableTileGroup(
                  AppStrings.labTitle,
                  labList,
                  state,
                  (val) => diamondFacade.updateLab(val),
                ),
                SelectableTileGroup(
                  AppStrings.shapeTitle,
                  shapeList,
                  state,
                  (val) => diamondFacade.updateShape(val),
                ),
                SelectableTileGroup(
                  AppStrings.colorTitle,
                  colorList,
                  state,
                  (val) => diamondFacade.updateColor(val),
                ),
                SelectableTileGroup(
                  AppStrings.clarityTitle,
                  clarityList,
                  state,
                  (val) => diamondFacade.updateClarity(val),
                ),
                SizedBox(
                  height: hRes(20),
                ),
                SizedBox(
                  width: double.infinity,
                  height: hRes(40),
                  child: ElevatedButton(
                    onPressed: () {
                      diamondFacade.applyFilters();
                      showSnackBar(AppStrings.filterAppliedSuccessTitle);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      AppStrings.applyFiltersTitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.surfaceLight,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
