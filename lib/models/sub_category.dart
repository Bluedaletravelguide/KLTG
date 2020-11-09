import 'package:flutter/cupertino.dart';

class SubCategory {
  final String id;
  final String subCategoryTitle;
  final String categories;
  final String image;
  final String description;
  

  const SubCategory({
  @required this.id,
    this.categories,
    this.subCategoryTitle,
    this.image,
    this.description,
  });
}
