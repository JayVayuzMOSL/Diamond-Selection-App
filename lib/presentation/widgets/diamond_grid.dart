import 'package:flutter/material.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_colors.dart';
import 'package:kgk_diamonds_group_app/core/constants/app_strings.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_styles.dart';
import 'package:kgk_diamonds_group_app/data/models/diamond_model.dart';
import 'package:kgk_diamonds_group_app/domain/diamond_facade.dart';

class DiamondGrid extends StatelessWidget {
  final List<DiamondModel> diamonds;
  final DiamondFacade diamondFacade;

  const DiamondGrid({required this.diamonds, required this.diamondFacade, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: diamonds.length,
      itemBuilder: (context, index) {
        return DiamondCard(diamond: diamonds[index], diamondFacade: diamondFacade);
      },
    );
  }
}

class DiamondCard extends StatelessWidget {
  final DiamondModel diamond;
  final DiamondFacade diamondFacade;

  const DiamondCard({required this.diamond, required this.diamondFacade, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  child: Image.asset(
                    AppStrings.diamondAsset,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: wRes(8.0),
                  right: wRes(8.0),
                  top: wRes(4.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${AppStrings.finalPriceTitle}: ${(diamond.carat * diamond.perCaratRate).toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.textLight,
                          ),
                    ),
                    SizedBox(
                      height: hRes(2),
                    ),
                    _buildDiamondDetails(context),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () => diamondFacade.addToCart(diamond),
              icon: const Icon(
                Icons.add_shopping_cart,
                color: AppColors.backgroundLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiamondDetails(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textLight),
        children: [
          _buildDetailSpan(
            context,
            AppStrings.shapeTitle,
            diamond.shape,
          ),
          _buildDetailSpan(
            context,
            AppStrings.caratTitle,
            "${diamond.carat}ct",
          ),
          _buildDetailSpan(
            context,
            AppStrings.clarityTitle,
            diamond.clarity,
          ),
          _buildDetailSpan(
            context,
            AppStrings.labTitle,
            diamond.lab,
          ),
          _buildDetailSpan(
            context,
            AppStrings.colorTitle,
            diamond.color,
          ),
        ],
      ),
    );
  }

  TextSpan _buildDetailSpan(BuildContext context, String title, String value) {
    return TextSpan(
      children: [
        TextSpan(
          text: "$title: ",
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.textLight),
        ),
        TextSpan(
          text: "$value\n",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.textLight),
        ),
      ],
    );
  }
}
