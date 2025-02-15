enum SortOption {
  priceHighToLow("Price: High to Low"),
  priceLowToHigh("Price: Low to High"),
  caratHighToLow("Carat: High to Low"),
  caratLowToHigh("Carat: Low to High");

  final String title;

  const SortOption(this.title);
}
