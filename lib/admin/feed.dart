import 'package:flutter/material.dart';
import 'package:tiktokgov/views/videoStuff/profileStuff/profile.dart';

import '../views/videoStuff/videoFeed.dart';

class MainFeed extends StatefulWidget {
  const MainFeed({super.key});

  @override
  State<MainFeed> createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  int _selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.92,
            child: buildingViews(),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      setState(() {
                        _selectedScreen = 1;
                        setState(() {});
                        print(_selectedScreen);
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          _selectedScreen != 1
                              ? Icons.home_outlined
                              : Icons.home,
                          color: _selectedScreen == 1
                              ? Colors.black
                              : Colors.black,
                          size: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03),
                        ),
                      ],
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        setState(() {
                          _selectedScreen = 2;
                          print(_selectedScreen);
                        });
                      },
                      child: Column(
                        children: [
                          Icon(
                            _selectedScreen != 2
                                ? Icons.search
                                : Icons.saved_search_outlined,
                            color: _selectedScreen == 2
                                ? Colors.black
                                : Colors.black,
                            size: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Text('Discover',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03))
                        ],
                      )),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      setState(() {
                        _selectedScreen = 3;
                        print(_selectedScreen);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.01),
                      decoration: BoxDecoration(
                        color: _selectedScreen == 3 ? Colors.black : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _selectedScreen == 3
                              ? Colors.black.withOpacity(0.12)
                              : Colors.transparent,
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        _selectedScreen == 3 ? Icons.add : Icons.add,
                        color:
                            _selectedScreen == 3 ? Colors.white : Colors.black,
                        size: MediaQuery.of(context).size.width * 0.1,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        setState(() {
                          _selectedScreen = 4;
                          print(_selectedScreen);
                        });
                      },
                      child: Column(
                        children: [
                          Icon(
                            _selectedScreen == 4
                                ? Icons.chat
                                : Icons.chat_outlined,
                            color: _selectedScreen == 4
                                ? Colors.black
                                : Colors.black,
                            size: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Text('Inbox',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03))
                        ],
                      )),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        setState(() {
                          _selectedScreen = 5;
                          print(_selectedScreen);
                        });
                      },
                      child: Column(
                        children: [
                          Icon(
                            _selectedScreen == 5
                                ? Icons.person
                                : Icons.person_outline_sharp,
                            color: _selectedScreen == 5
                                ? Colors.black
                                : Colors.black,
                            size: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Text('Me',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03))
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildingViews() {
    switch (_selectedScreen) {
      case 1:
        return const VideoFeed();
      case 2:
        return Container();
      case 3:
        return Container();
      case 4:
        return Container();
      case 5:
        return const Profile();
      default:
        return Container();
    }
  }
}
