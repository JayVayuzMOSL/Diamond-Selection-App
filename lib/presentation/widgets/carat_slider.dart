import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk_diamonds_group_app/application/filter/filter_cubit.dart';
import 'package:kgk_diamonds_group_app/application/filter/filter_state.dart';
import 'package:kgk_diamonds_group_app/core/constants/app_strings.dart';
import 'package:kgk_diamonds_group_app/domain/diamond_facade.dart';

class CaratSlider extends StatelessWidget {
  final DiamondFacade diamondFacade;

  const CaratSlider({super.key, required this.diamondFacade});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.caratTitle,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            RangeSlider(
              values: RangeValues(state.caratFrom, state.caratTo),
              min: 0.0,
              max: 6.0,
              divisions: 10,
              labels: RangeLabels('${state.caratFrom}', '${state.caratTo}'),
              onChanged: (range) => diamondFacade.updateCaratRange(range.start, range.end),
            ),
          ],
        );
      },
    );
  }
}
