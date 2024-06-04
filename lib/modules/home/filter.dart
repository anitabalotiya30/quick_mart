import 'package:get/get.dart';

class FilterModel {
  final Filters filter;
  final List<String> list;
  final selectedListItem = ''.obs;

  FilterModel({required this.filter, required this.list}) {
    selectedListItem.value = list.first;
  }
}

enum Filters { category, price }

extension MyFilter on Filters {
  String get title => switch (this) {
        Filters.category => 'Category',
        Filters.price => 'Price'
      };

  List<String> get list => switch (this) {
        Filters.category => ['Electronics', 'Furniture', 'Shoes'],
        Filters.price => ['\$20 - \$50', '\$50 - \$70', '\$70 - \$100']
      };
}
