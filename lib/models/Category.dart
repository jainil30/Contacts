/// category_id : 0
/// category_name : "Office"

class Category {
  Category({
    num? categoryId,
    String? categoryName,
  }) {
    _categoryId = categoryId;
    _categoryName = categoryName;
  }

  Category.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _categoryName = json['category_name'];
  }
  num? _categoryId;
  String? _categoryName;
  Category copyWith({
    num? categoryId,
    String? categoryName,
  }) =>
      Category(
        categoryId: categoryId ?? _categoryId,
        categoryName: categoryName ?? _categoryName,
      );
  num? get categoryId => _categoryId;
  String? get categoryName => _categoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    map['category_name'] = _categoryName;
    return map;
  }
}
