import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk_diamonds_group_app/application/result/result_cubit.dart';
import 'package:kgk_diamonds_group_app/application/result/result_state.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_colors.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_styles.dart';
import 'package:kgk_diamonds_group_app/core/constants/enums.dart';
import 'package:kgk_diamonds_group_app/domain/diamond_facade.dart';

class SortDropdown extends StatelessWidget {
  final DiamondFacade diamondFacade;

  const SortDropdown({required this.diamondFacade, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: wRes(16.0),
        vertical: hRes(8.0),
      ),
      child: BlocBuilder<ResultCubit, ResultState>(
        builder: (context, state) {
          return DropdownButtonFormField<SortOption>(
            value: SortOption.priceHighToLow,
            onChanged: (SortOption? newSortOption) {
              if (newSortOption != null) {
                diamondFacade.sortDiamonds(newSortOption);
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: wRes(12),
                vertical: hRes(10),
              ),
            ),
            items: SortOption.values.map((sortOption) {
              return DropdownMenuItem(
                value: sortOption,
                child: Text(
                  sortOption.title,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: AppColors.textLight),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
