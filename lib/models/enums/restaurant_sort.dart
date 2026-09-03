enum RestaurantSort{
  nearby,
  sales,
  rate,
  fast
}

extension RestaurantSortExtension on RestaurantSort{
  String get queryValue{
    switch(this){
      case RestaurantSort.nearby:
      return 'nearby';
      case RestaurantSort.sales:
      return 'sales';
      case RestaurantSort.rate:
      return 'rating';
      case RestaurantSort.fast:
      return 'fastest';
    }
  }
}