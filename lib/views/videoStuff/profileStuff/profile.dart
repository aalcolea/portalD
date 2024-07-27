import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktokgov/views/videoStuff/profileStuff/accountProfile.dart';
import 'package:tiktokgov/views/videoStuff/profileStuff/pageView/likes.dart';
import 'package:tiktokgov/views/videoStuff/profileStuff/pageView/myFeed.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.08),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.withOpacity(0.35), width: 0.4))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person_add_alt_outlined,
                        size: MediaQuery.of(context).size.width * 0.1,
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: const AccountProfileBox(),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        size: MediaQuery.of(context).size.width * 0.1,
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.06,
                bottom: MediaQuery.of(context).size.width * 0.02,
              ),
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.14,
              ),
            ),
            const Text(
              '@juanitoR',
              style:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w400),
            ),
            Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Column(
                    children: [
                      Text(
                        '14',
                        style: TextStyle(
                            fontFamily: 'Inter', fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                            color: Color(0xFF86878B),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.08),
                      child: const Column(children: [
                        Text(
                          '38',
                          style: TextStyle(
                              fontFamily: 'Inter', fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(
                              color: Color(0xFF86878B),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400),
                        )
                      ])),
                  const Column(children: [
                    Text(
                      '91',
                      style: TextStyle(
                          fontFamily: 'Inter', fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Likes',
                      style: TextStyle(
                          color: Color(0xFF86878B),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400),
                    )
                  ])
                ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    side: const BorderSide(
                        color: Color(0xFFE3E3E4)), // Borde negro
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Edit profile',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    side: const BorderSide(
                      color: Color(0xFFE3E3E4),
                    ), //
                  ),
                  onPressed: () {},
                  child: const Icon(
                    CupertinoIcons.bookmark,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Tap to add bio',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF86878B),
                  ),
                )),

            ///pageview
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.39,
              decoration: const BoxDecoration(),
              child: PageView(children:
              [
                MyFeed(),
                Likes(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
