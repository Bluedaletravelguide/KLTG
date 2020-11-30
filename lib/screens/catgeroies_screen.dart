// This imports used to call a library, screen path or class path.

import 'package:flutter/material.dart';
import '../Data/categories_data.dart';
import '../widgets/categories_widget.dart';

class CategoriesScreen extends StatefulWidget {

  
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: MediaQuery.of(context).size.width>500? 3.5:2.7,
      //This function used to direct the data from the data folder(CategoriesData) to Catgeories widget.
      //The widget was saved in the widget folder.
      children: CategoriesData.map(
        (con) => Catgeories(
          con.id,
          con.title,
          con.color,
          con.image,
        ),
      ).toList(),
    );
  }
}
