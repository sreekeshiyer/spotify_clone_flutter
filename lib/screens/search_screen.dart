import "package:flutter/material.dart";
import 'dart:math' as math;

import 'search_results_screen.dart';

class SearchScreen extends StatefulWidget {
  static const String id = 'search_screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final topGenres = [
    {
      "title": "Classical",
      "image":
          "https://i.scdn.co/image/ab67706f000000023e0130fcd5d106f1402b4707",
    },
    {
      "title": "Indie",
      "image":
          "https://i.scdn.co/image/ab67706f000000025f7327d3fdc71af27917adba",
    },
    {
      "title": "Hip-hop",
      "image":
          "https://i.scdn.co/image/ab67706f000000029bb6af539d072de34548d15c",
    },
    {
      "title": "Chill",
      "image":
          "https://i.scdn.co/image/ab67706f00000002c414e7daf34690c9f983f76e",
    },
  ];

  final browseGenres = [
    {
      "title": "Podcasts",
      "image":
          "https://i.scdn.co/image/567158eb895ad26718a814345af0fc43ee785ec5",
    },
    {
      "title": "Charts",
      "image":
          "https://charts-images.scdn.co/assets/locale_en/regional/weekly/region_global_default.jpg",
    },
    {
      "title": "Rock",
      "image":
          "https://i.scdn.co/image/ab67706f00000002fe6d8d1019d5b302213e3730",
    },
    {
      "title": "Focus",
      "image":
          "https://i.scdn.co/image/ab67706f00000002e4eadd417a05b2546e866934",
    },
    {
      "title": "Sleep",
      "image":
          "https://i.scdn.co/image/ab67706f00000002b70e0223f544b1faa2e95ed0",
    },
    {
      "title": "Gaming",
      "image":
          "https://i.scdn.co/image/ab67706f0000000221a2087747d946f16704b8af",
    },
    {
      "title": "Mood",
      "image":
          "https://i.scdn.co/image/ab67706f00000002aa93fe4e8c2d24fc62556cba",
    },
    {
      "title": "Workout",
      "image":
          "https://i.scdn.co/image/ab67706f000000029249b35f23fb596b6f006a15",
    },
    {
      "title": "Folk & Acoustic",
      "image":
          "https://i.scdn.co/image/ab67706f0000000237df164786f688dd0ccd8744",
    },
    {
      "title": "At Home",
      "image":
          "https://i.scdn.co/image/ab67706f00000002ec9d60059aa215a7ba364695",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                        child: const Text(
                          'Search',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, SearchResultsScreen.id)
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10.0),
                                  child: Icon(
                                    Icons.search_outlined,
                                    semanticLabel: 'Search Icon',
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                                Text('Artists, songs or podcasts',
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                        child: const Text(
                          'Your Top Genres',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Wrap(
                        children: [
                          for (int i = 0; i < topGenres.length; i++)
                            FractionallySizedBox(
                              widthFactor: 0.5,
                              child: Container(
                                height: 100.0,
                                decoration: BoxDecoration(
                                    color: Color((math.Random().nextDouble() *
                                                0xFFFFFF)
                                            .toInt())
                                        .withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(10)),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Text(
                                          "${topGenres[i]["title"]}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Transform.rotate(
                                        angle: -math.pi / 4,
                                        origin: const Offset(45, 5),
                                        child: Image(
                                          alignment: Alignment.bottomRight,
                                          image: NetworkImage(
                                              '${topGenres[i]['image']}'),
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                        child: const Text(
                          'Browse All',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Wrap(
                        children: [
                          for (int i = 0; i < browseGenres.length; i++)
                            FractionallySizedBox(
                              widthFactor: 0.5,
                              child: Container(
                                height: 100.0,
                                decoration: BoxDecoration(
                                    color: Color((math.Random().nextDouble() *
                                                0xFFFFFF)
                                            .toInt())
                                        .withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(10)),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Text(
                                          "${browseGenres[i]["title"]}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Transform.rotate(
                                        angle: -math.pi / 4,
                                        origin: const Offset(45, 5),
                                        child: Image(
                                          alignment: Alignment.bottomRight,
                                          image: NetworkImage(
                                              '${browseGenres[i]['image']}'),
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreens(int index) {
    const map = {0: "browse_screen", 2: "library_screen"};

    if (index == 1) return;
    if (index == 2) {
      Navigator.popAndPushNamed(context, map[index]!);
    } else if (index == 0) {
      Navigator.pop(context);
    }
  }
}
