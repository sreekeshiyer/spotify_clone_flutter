import "package:flutter/material.dart";

import 'library_screen.dart';
import 'search_screen.dart';

class BrowseScreen extends StatefulWidget {
  static const String id = 'browse_screen';
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  final recent = [
    {
      "image":
          "https://i.scdn.co/image/138ab4417c9b59df67fc22f721afecbf16c18a89",
      "text": "The One Byte Show"
    },
    {
      "image":
          "https://i.scdn.co/image/ab67656300005f1f487d499655503fbb7cc627bf",
      "text": "Lew Later"
    },
    {
      "image":
          "https://mosaic.scdn.co/300/ab67616d00001e020f9d33cae4a0275e8fd28b93ab67616d00001e02662ce40b359cf7f6990fbee8ab67616d00001e0284feca0133d9a8e6539a8325ab67616d00001e02dbf223dbb6abdffa642eb287",
      "text": "Playlist 2"
    },
    {
      "image":
          "https://i.scdn.co/image/ab67706c0000bebbe677d61dfd382bdb9a32d14d",
      "text": "Streambeats Lo-Fi"
    }
  ];

  final episodesForYou = [
    {
      "image":
          "https://i.scdn.co/image/ab67656300005f1f96811325d5319bb441eee468",
      "title": "Let's talk about the Pixel 6 Pro",
      "author": "Waveform"
    },
    {
      "image":
          "https://i.scdn.co/image/ab6765630000ba8af3ff5141500c30cde49f53d9",
      "title":
          "Google Says Apple \"benefits from bullying\" through iMessage Lock in",
      "author": "The Digital Dive"
    },
    {
      "image":
          "https://i.scdn.co/image/ab67656300005f1f9c104d0484a2bfb820d8997e",
      "title": "Just Line and Length with Shaun Pollock",
      "author": "22 Yarns"
    },
    {
      "image":
          "https://i.scdn.co/image/ab67656300005f1f07c161c42b3a420250fc3f25",
      "title":
          "New iPad Pro in the fall could have Apple Silicon M2 Chip, maybe not MagSafe... and more news",
      "author": "Apple Insider"
    }
  ];

  final madeForYou = [
    {
      "image":
          "https://seed-mix-image.spotifycdn.com/v6/img/sixties/1SJOL9HJ08YOn92lFcYf8a/en/default",
      "title": "Shankar Mahadevan, Mohammed Rafi and more",
    },
    {
      "image":
          "https://newjams-images.scdn.co/image/ab676477000033ad/dt/v3/discover-weekly/BIjxZxgqmTo-bYTSZQYc3BwSePCrSppcabZEwxV0cOUsnHa3Dqs2sVsu5YyWWW0T2MoJQ1197athsQaK-MFApIjAGpeYd5wE4x1VJ4nH6_o=/OTA6MzA6MDJUNjItMTAtMg==",
      "title": "Your Weekly Mixtape of fresh music. Enjoy new music and..",
    },
    {
      "image":
          "https://newjams-images.scdn.co/v3/release-radar/ab6761610000e5eb3a7d849b89d6ba9f5bd81639/en/default",
      "title":
          "Catch all the latest music from the artists you follow, plus new..",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black],
          ),
        ),
        child: BottomNavigationBar(
            currentIndex: 0,
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
            ]),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: const Alignment(-0.5, -0.55),
            colors: [
              Colors.yellow.shade200.withOpacity(0.4),
              const Color(0xFF111114),
            ],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Recently Played',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.restore,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.settings_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 160.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recent.length,
                  itemBuilder: (BuildContext context, int i) => Card(
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    child: SizedBox(
                        width: 120.0,
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: NetworkImage('${recent[i]['image']}'),
                                width: 120,
                                height: 120,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Text(
                                  '${recent[i]['text']}',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 25, 0, 15),
                child: const Text(
                  'Episodes For You',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 220.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: episodesForYou.length,
                  itemBuilder: (BuildContext context, int i) => Card(
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    child: SizedBox(
                      width: 150.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image:
                                  NetworkImage('${episodesForYou[i]['image']}'),
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              '${episodesForYou[i]['title']}',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Text(
                              '${episodesForYou[i]['author']}',
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 25, 0, 15),
                child: const Text(
                  'Made For Sreekesh Iyer',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 220.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: madeForYou.length,
                  itemBuilder: (BuildContext context, int i) => Card(
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    child: SizedBox(
                      width: 150.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: NetworkImage('${madeForYou[i]['image']}'),
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              '${madeForYou[i]['title']}',
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToScreens(int index) {
    const map = {1: SearchScreen.id, 2: LibraryScreen.id};

    if (index == 0) return;
    if (index == 1 || index == 2) {
      Navigator.pushNamed(context, map[index]!);
    }
  }
}
