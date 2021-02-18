import 'package:flutter/material.dart';
import '../Data/content_list_data.dart';
import '../widgets/content_list_widget.dart';

class DataSearch extends SearchDelegate<String> {
  final info = [
    'Lot 10',
    'Central Market',
    'Bangsar',
    'Changkat',
    'Petailing Street',
    'Royal Chulan',
    'Majestic Hotel',
    'Furama Hotel'
  ];
  final recent = [
    'Petailing Street',
    'Royal Chulan',
    'Majestic Hotel',
    'Furama Hotel'
  ];

  DataSearch({
    String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final queryList = ContentListData.where((queryList) {
      return queryList.contentListTitle.contains(query);
    }).toList();
    return SafeArea(
      child: Material(
        child: GridView.builder(
          padding: EdgeInsets.all(8),
          itemBuilder: (ctx, index) {
            return ContentList(
              id: queryList[index].id,
              title: queryList[index].contentListTitle,
              image: queryList[index].image,
            );
          },
          itemCount: queryList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.97,
            crossAxisSpacing: 4,
            mainAxisSpacing: 3,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recent
        : info.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
          },
          leading: Icon(Icons.info),
          title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ]),
          )),
      itemCount: suggestionList.length,
    );
  }
}
