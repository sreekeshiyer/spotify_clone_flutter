import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '/utils/auth_service.dart';

class LibraryScreen extends StatefulWidget {
  static const String id = 'library_screen';
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late User loggedInUser;
  // ignore: prefer_typing_uninitialized_variables
  late var userData;

  @override
  void initState() {
    super.initState();

    // Future.delayed(Duration.zero, getUser);
    getUser();
    getUserData();
  }

  void getUser() {
    final user = Provider.of<User?>(context, listen: false);
    if (user != null) {
      loggedInUser = user;
    }
  }

  void getUserData() async {
    userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(loggedInUser.uid)
        .get();
  }

  final library = [
    {
      "image":
          "https://i.scdn.co/image/ab67706c0000da84e677d61dfd382bdb9a32d14d",
      "title": "Streambeats Lo-Fi",
      "type": "Playlist • Streambeats Official"
    },
    {
      "image":
          "https://i.scdn.co/image/ab67656300005f1f487d499655503fbb7cc627bf",
      "title": "Lew Later",
      "type": "Podcast • Lew Later"
    },
    {
      "image":
          "https://mosaic.scdn.co/300/ab67616d00001e020f9d33cae4a0275e8fd28b93ab67616d00001e02662ce40b359cf7f6990fbee8ab67616d00001e0284feca0133d9a8e6539a8325ab67616d00001e02dbf223dbb6abdffa642eb287",
      "title": "Playlist 2",
      "type": "Playlist • Sreekesh Iyer"
    },
    {
      "image":
          "https://i.scdn.co/image/ab67656300005f1f96811325d5319bb441eee468",
      "title": "Waveform: The MKBHD Podcast",
      "type": "Podcast • Vox Media Podcast Network"
    },
    {
      "image":
          "https://i.scdn.co/image/138ab4417c9b59df67fc22f721afecbf16c18a89",
      "title": "The One Byte Show",
      "type": "Podcast • Zenon, Anirudh, Naggesh and Rajarshi"
    },
    {
      "image":
          "https://i.scdn.co/image/ab67656300005f1ff3ff5141500c30cde49f53d9",
      "title": "The Digital Dive",
      "type": "Podcast • Jacklyn Dallas and Darsh Khithani"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111114),
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
            currentIndex: 2,
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
      appBar: AppBar(
        shadowColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: const Image(
                image: NetworkImage(
                    'https://i.scdn.co/image/ab6775700000ee85b33a446fa1b73f124869ee0f'),
                width: 40,
                height: 40,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: const Text("Your Library",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF111114),
        automaticallyImplyLeading: false,
        actions: [
          const IconButton(
            onPressed: null,
            iconSize: 30,
            icon: Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            iconSize: 30,
            onPressed: () {
              context.read<AuthService>().signOut();
              Navigator.popAndPushNamed(context, 'launch_screen');
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: library.length,
                itemBuilder: (BuildContext context, int i) => Container(
                  color: Colors.transparent,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                            image: NetworkImage('${library[i]['image']}'),
                            width: 75,
                            height: 75),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    '${library[i]['title']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                Text(
                                  '${library[i]['type']}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade400),
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreens(int index) {
    const map = {0: "browse_screen", 1: "search_screen"};

    if (index == 2) return;
    if (index == 1) {
      Navigator.popAndPushNamed(context, map[index]!);
    } else if (index == 0) {
      Navigator.pop(context);
    }
  }
}
