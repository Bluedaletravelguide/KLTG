import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import '../Data/content_list_data.dart';
import '../widgets/content_list_widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static const historyLength = 5;

  List<String> _searchHistory = [''].reversed.toList();
  List<String> filteredSearchHistory;

  String selectedTerm;

  //Key words when users key in their search terms
  List<String> _searchSuggestion = [
    'Bukit Bintang',
    'KLCC',
    'KL Sentral',
    'Bangsar South',
    'Bangsar',
    'Chinatown',
    'Petaling Street',
    'Dental',
    'Dermatologist',
    'Health Care Services',
    'Royal Chulan',
    'Westin',
    'Majestic Hotel',
    'Furama Hotel',
    'JW Marriot',
    'Prescott Hotel',
    'Hilton',
    'InterContinental Hotel',
    'KL',
    'Kuala Lumpur',
    'Sultan Abdul Samad Building',
    'Central Market',
    'Pasar Seni',
    'Dataran Merdeka',
    'Malayan Railway Administartion Building',
    'National Monument',
    'Taman Eko Rimba',
    'ASEAN Culture Garden',
    'Ampang Hilir Park',
    'Kepong Metropolitan Park',
    'Taman Tasik Titiwangsa',
    'Taman Tasik Permaisuri',
    'Botanical Gardens',
    'Putrajaya',
    'Desa Park City',
    'Bukit Kiara Trail',
    'Kompang',
    'Rebana Ubi',
    'Gambus',
    'Gamelan',
    'Serunai',
    'Guqin',
    'Erhu',
    'Tanggu',
    'Gong',
    'Bangu',
    'Sitar',
    'Veena',
    'Tabla',
    'Mridangam',
    'Ghatam',
    'Congkak',
    'Batu Seremban',
    'Top Spinning',
    'Kite Flying',
    'Wau',
    'Restaurant',
    'Korean',
    'Japanese',
    'Masjid',
    'Temple',
    'Cathedral',
    'Chruch',
    'Gurdwara',
    'Ossoto Recreation Hub',
    'Spa',
    'Swasana Spa',
    'Alam Beauty and Wellness Spa',
    'Uroot Spa',
    'Bali Ayu Spa Sanctuary',
    'Manjakaki',
    'Erawan Wellness Massage',
    'Reborn Foot Reflexology',
    'National Science Centre',
    'KL Upside Down House',
    'National Planetarium',
    'KL tower Mini Zoo',
    'Lot 10',
    'Shoppes by Four Seasons Place KL',
    'Pavilion KL',
    'Changkat',
    'Ampang',
    'Jalan Alor',
    'Taman Connaught Night Market',
    'Tapak Urban Street Dining'
  ].reversed.toList();
  List<String> filteredSearchSuggestion;

  //Checks whether the users have the search history stored in the app.
  List<String> filteredSearchHistoryTerm({@required String filter}) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.toLowerCase().startsWith(filter.toLowerCase()))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  List<String> filteredSearchSuggestions({@required String filter}) {
    if (filter != null && filter.isNotEmpty) {
      return _searchSuggestion.reversed
          .where((term) => term.toLowerCase().startsWith(filter.toLowerCase()))
          .toList();
    } else {
      return [''].toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);
    _searchHistory.remove('');

    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filteredSearchHistoryTerm(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    if (_searchHistory.isEmpty) {
      _searchHistory.add('');
    }
    filteredSearchHistory = filteredSearchHistoryTerm(filter: null);
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
    filteredSearchHistory = filteredSearchHistoryTerm(filter: null);
    filteredSearchSuggestion = filteredSearchSuggestions(filter: null);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //The main search engine functionality.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
      builder: (context) => FloatingSearchBar(
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
            filteredSearchHistory =
                filteredSearchHistoryTerm(filter: query.toLowerCase());
            filteredSearchSuggestion =
                filteredSearchSuggestions(filter: query.toLowerCase());
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
                  if (controller.query.isEmpty &&
                      filteredSearchHistory.contains('') &&
                      filteredSearchSuggestion.contains('')) {
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
                  } else if (filteredSearchHistory.isNotEmpty ||
                      filteredSearchHistory.contains(filteredSearchSuggestion
                          .contains(controller.query))) {
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
                  } else if (filteredSearchSuggestion.isNotEmpty) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: filteredSearchSuggestion
                          .map((term) => ListTile(
                                title: Text(
                                  term,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                leading: const Icon(Icons.info),
                                onTap: () {
                                  setState(() {
                                    addSearchTerm(term);
                                    selectedTerm = term;
                                  });
                                  controller.close();
                                },
                              ))
                          .toList(),
                    );
                  } else {
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
                  }
                },
              ),
            ),
          );
        },
      ),
    ));
  }
}

//The page where it shows the search results.
//Checks whether any search term matches with the content available in the app.
class SearchResultsListView extends StatelessWidget {
  final String searchTerm;

  SearchResultsListView({
    Key key,
    @required this.searchTerm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final fsb = FloatingSearchBar.of(context);
    if (searchTerm == null) {
      return Padding(
          padding: EdgeInsets.only(top: 16.0),
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
                  style: Theme.of(context).textTheme.headline1,
                ),
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
          padding: EdgeInsets.only(top: 16.0),
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
                  style: Theme.of(context).textTheme.headline1,
                )
              ],
            ),
          ));
    }

    return Padding(
      padding: EdgeInsets.only(top: 16.0),
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
