import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import '../Data/content_list_data.dart';
import '../widgets/content_list_widget.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static const historyLength = 5;

  List<String> _searchHistory = [
    'Bangsar',
    'Lot 10',
    'Petailing Street',
    'Changkat',
  ].reversed.toList();

  List<String> filteredSearchHistory;
  String selectedTerm;

  List<String> filteredSearchTerm({@required String filter}) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }

    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filteredSearchTerm(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filteredSearchTerm(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filteredSearchTerm(filter: null);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        body: FloatingSearchBar(
      controller: controller,
      body: FloatingSearchBarScrollNotifier(
        child: SearchResultsListView(searchTerm: selectedTerm),
      ),
      transition: CircularFloatingSearchBarTransition(),
      physics: BouncingScrollPhysics(),
      title: Text(
        selectedTerm ?? 'KL THE GUIDE',
        style: Theme.of(context).textTheme.headline4,
      ),
      hint: 'Search KL the Guide',
      actions: [
        FloatingSearchBarAction.searchToClear(),
      ],
      onQueryChanged: (query) {
        setState(() {
          filteredSearchHistory = filteredSearchTerm(filter: query);
        });
      },
      onSubmitted: (query) {
        setState(() {
          addSearchTerm(query);
          selectedTerm = query;
        });
        controller.close();
      },
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4,
            child: Builder(
              builder: (context) {
                if (filteredSearchHistory.isEmpty && controller.query.isEmpty) {
                  return Container(
                    height: 56,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Start searching',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  );
                } else if (filteredSearchHistory.isEmpty) {
                  return ListTile(
                    title: Text(controller.query),
                    leading: const Icon(Icons.search),
                    onTap: () {
                      setState(() {
                        addSearchTerm(controller.query);
                        selectedTerm = controller.query;
                      });
                      controller.close();
                    },
                  );
                } else {
                  return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: filteredSearchHistory
                          .map((term) => ListTile(
                                title: Text(
                                  term,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                leading: const Icon(Icons.history),
                                trailing: IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    setState(() {
                                      deleteSearchTerm(term);
                                    });
                                  },
                                ),
                                onTap: () {
                                  setState(() {
                                    putSearchTermFirst(term);
                                    selectedTerm = term;
                                  });
                                  controller.close();
                                },
                              ))
                          .toList());
                }
              },
            ),
          ),
        );
      },
    ));
  }
}

class SearchResultsListView extends StatelessWidget {
  final String searchTerm;

  SearchResultsListView({
    Key key,
    @required this.searchTerm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fsb = FloatingSearchBar.of(context);
    if (searchTerm == null) {
      return Padding(
          padding: EdgeInsets.only(top: fsb.height + fsb.margins.vertical),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.search,
                  size: 128,
                ),
                Text(
                  'Type in the field above to search.',
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
          ));
    }
    final queryList = ContentListData.where((queryList) {
      return queryList.contentListTitle
          .toLowerCase()
          .contains(searchTerm.toLowerCase());
    }).toList();

    if (queryList.isEmpty) {
      return Padding(
          padding: EdgeInsets.only(top: fsb.height + fsb.margins.vertical),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error,
                  size: 128,
                ),
                Text(
                  'No results!',
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
          ));
    }

    return Padding(
      padding: EdgeInsets.only(top: fsb.height + fsb.margins.vertical),
      child: SafeArea(
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
      ),
    );
  }
}
