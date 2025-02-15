import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk_diamonds_group_app/application/cart/cart_cubit.dart';
import 'package:kgk_diamonds_group_app/application/filter/filter_cubit.dart';
import 'package:kgk_diamonds_group_app/application/result/result_cubit.dart';
import 'package:kgk_diamonds_group_app/core/constants/app_constants.dart';
import 'package:kgk_diamonds_group_app/core/constants/app_strings.dart';
import 'package:kgk_diamonds_group_app/core/constants/enums.dart';
import 'package:kgk_diamonds_group_app/data/models/diamond_model.dart';

class DiamondFacade {
  final ResultCubit resultCubit;
  final CartCubit cartCubit;
  final FilterCubit filterCubit;

  DiamondFacade._({required this.resultCubit, required this.cartCubit, required this.filterCubit});

  static DiamondFacade initialize(BuildContext context) {
    return DiamondFacade._(
        resultCubit: context.read<ResultCubit>(),
        cartCubit: context.read<CartCubit>(),
        filterCubit: context.read<FilterCubit>());
  }

  void applyFilters() {
    Map<String, dynamic> filters = {
      'lab': filterCubit.state.selectedLab,
      'shape': filterCubit.state.selectedShape,
      'color': filterCubit.state.selectedColor,
      'clarity': filterCubit.state.selectedClarity,
      'caratFrom': filterCubit.state.caratFrom,
      'caratTo': filterCubit.state.caratTo,
    };
    resultCubit.filteredDiamondList(filters: filters);
  }

  void sortDiamonds(SortOption sortOption) {
    resultCubit.sortDiamonds(sortOption);
  }

  void addToCart(DiamondModel diamond) {
    cartCubit.addToCart(diamond).then((value){
      showSnackBar(AppStrings.cartAddedSuccessTitle);
    });
  }

  void loadCart() {
    cartCubit.loadCart();
  }

  void removeFromCart(String lotId) {
    cartCubit.removeFromCart(lotId).then((value){
      showSnackBar(AppStrings.cartRemovedSuccessTitle);
    });
  }

  void updateCaratRange(double from, double to) {
    filterCubit.updateCaratRange(from, to);
  }

  void updateLab(String lab) {
    filterCubit.updateLab(lab);
  }

  void updateShape(String shape) {
    filterCubit.updateShape(shape);
  }

  void updateColor(String color) {
    filterCubit.updateColor(color);
  }

  void updateClarity(String clarity) {
    filterCubit.updateClarity(clarity);
  }

  void resetFilters() {
    filterCubit.resetFilters();
  }

  updateQuantity(double qty) {
    filterCubit.updateQuantity(qty);
  }
}
