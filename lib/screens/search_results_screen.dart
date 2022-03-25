import "package:flutter/material.dart";
import 'search_screen.dart';

class SearchResultsScreen extends StatefulWidget {
  static const String id = 'search_results_screen';
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  var searchFocus = true;
  var listViewFocus = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchFocus == true
          ? AppBar(
              title: TextField(
                cursorColor: Colors.green,
                enableSuggestions: false,
                autofocus: searchFocus,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Query',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                ),
                onChanged: (value) => {
                  if (value != '')
                    {
                      setState(() {
                        listViewFocus = true;
                      })
                    }
                  else
                    {
                      setState(() {
                        listViewFocus = false;
                      })
                    }
                },
              ),
            )
          : AppBar(
              centerTitle: true,
              title: GestureDetector(
                onTap: () {
                  setState(() {
                    searchFocus = true;
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade600.withOpacity(0.8),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Text(
                    'Search',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ),
              ),
              automaticallyImplyLeading: false,
            ),
      extendBody: true,
      backgroundColor: const Color(0xFF111114),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black],
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: 1,
          onTap: (int index) {
            _navigateToScreens(index);
          },
          selectedItemColor: Colors.white,
          backgroundColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Library',
            ),
          ],
        ),
      ),
      body: listViewFocus == true
          ? Container(
              alignment: Alignment.center,
              child: const Text('Hello'),
            )
          : Center(
              child: GestureDetector(
                onTap: () {
                  if (searchFocus == true) {
                    setState(() {
                      searchFocus = false;
                    });
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8.0),
                      child: const Text(
                        'Play what you love',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.5),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8.0),
                      child: Text(
                        'Search for artists, songs, podcasts, and more.',
                        style: TextStyle(
                          fontSize: 10.5,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void _navigateToScreens(int index) {
    const map = {0: "browse_screen", 2: "library_screen"};

    if (index == 1) return;
    if (index == 2) {
      Navigator.pop(context);
      Navigator.popAndPushNamed(context, map[index]!);
    } else if (index == 0) {
      Navigator.popUntil(context, ModalRoute.withName(SearchScreen.id));
      Navigator.pop(context);
    }
  }
}
