import 'package:flutter/material.dart';
import 'package:kgk_diamonds_group_app/application/filter/filter_state.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_colors.dart';
import 'package:kgk_diamonds_group_app/core/constants/app_strings.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_styles.dart';

class SelectableTileGroup extends StatelessWidget {
  final String title;
  final List<String> options;
  final FilterState state;
  final Function(String) onSelect;

  const SelectableTileGroup(this.title, this.options, this.state, this.onSelect, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.textLight,
              ),
        ),
        SizedBox(height: hRes(8)),
        Column(
          children: options.map((option) {
            bool selected = _getSelection(state, title) == option;
            return GestureDetector(
              onTap: () => onSelect(option),
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: hRes(4),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: hRes(12),
                  horizontal: wRes(16),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selected ? AppColors.primaryLight : AppColors.greyColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: selected ? Colors.blue.shade50 : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      option,
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: AppColors.textLight,
                          ),
                    ),
                    Icon(
                      selected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                      color: selected ? AppColors.primaryLight : AppColors.greyColor,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: hRes(10),
        ),
      ],
    );
  }

  String _getSelection(FilterState state, String title) {
    switch (title) {
      case AppStrings.labTitle:
        return state.selectedLab;
      case AppStrings.shapeTitle:
        return state.selectedShape;
      case AppStrings.colorTitle:
        return state.selectedColor;
      case AppStrings.clarityTitle:
        return state.selectedClarity;
      default:
        return '';
    }
  }
}
