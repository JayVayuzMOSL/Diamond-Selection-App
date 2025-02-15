import 'package:flutter/material.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_colors.dart';
import 'package:kgk_diamonds_group_app/core/constants/app_strings.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_styles.dart';
import 'package:kgk_diamonds_group_app/data/models/diamond_model.dart';

class CartSummary extends StatelessWidget {
  final List<DiamondModel> cartItems;

  const CartSummary({required this.cartItems, super.key});

  @override
  Widget build(BuildContext context) {
    double totalCarat = cartItems.fold(0.0, (sum, item) => sum + item.carat);
    double totalPrice = cartItems.fold(0.0, (sum, item) => sum + (item.carat * item.perCaratRate));
    double avgPrice = cartItems.isNotEmpty ? totalPrice / cartItems.length : 0.0;
    double avgDiscount = cartItems.isNotEmpty
        ? cartItems.fold(0.0, (sum, item) => sum + item.discount) / cartItems.length
        : 0.0;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: hRes(10), horizontal: wRes(15)),
          width: double.infinity,
          color: AppColors.greyColor,
          child: Text(
            AppStrings.swipeLeftForDeleteTitle,
            style:
                Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.backgroundLight),
          ),
        ),
        Container(
          padding: EdgeInsets.all(wRes(16)),
          decoration: const BoxDecoration(color: AppColors.greyColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSummaryRow(context, AppStrings.totalCaratTitle, totalCarat.toStringAsFixed(2)),
              _buildSummaryRow(
                  context, AppStrings.avgPriceTitle, '\$${avgPrice.toStringAsFixed(2)}'),
              _buildSummaryRow(
                  context, AppStrings.avgDiscountTitle, '${avgDiscount.toStringAsFixed(2)}%'),
              _buildSummaryRow(
                  context, AppStrings.totalTitle, '\$${totalPrice.toStringAsFixed(2)}'),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(BuildContext context, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.accentLight),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.textLight),
        ),
      ],
    );
  }
}
