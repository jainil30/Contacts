import 'package:hive/hive.dart';

/// categoryName : "office"

part 'category.g.dart';

//Category Model
@HiveType(typeId: 0)
class Category {
  Category({
    String? categoryName,
  }) {
    _categoryName = categoryName;
  }

  Category.fromJson(dynamic json) {
    _categoryName = json['categoryName'];
  }
  @HiveField(0)
  String? _categoryName;
  Category copyWith({
    String? categoryName,
  }) =>
      Category(
        categoryName: categoryName ?? _categoryName,
      );
  String? get categoryName => _categoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryName'] = _categoryName;
    return map;
  }
}
