import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'marqueeEffect.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String url;

  const VideoPlayerScreen({super.key, required this.url});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
          ),
          child: Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const CircularProgressIndicator(),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Following ',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.048,
                        color: const Color(0xFFFFFFFF)),
                  ),
                  Text(
                    'For You',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.048,
                        color: const Color(0xFFFFFFFF).withOpacity(0.6)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.014,
                bottom: MediaQuery.of(context).size.width * 0.018,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.12,
                height: MediaQuery.of(context).size.width * 0.12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.06,
                  // backgroundImage: NetworkImage('https://example.com/image.jpg'), // Puedes agregar una imagen de fondo si lo deseas
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.01,
                  top: MediaQuery.of(context).size.width * 0.04,
                  bottom: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Column(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        CupertinoIcons.heart_fill,
                        size: MediaQuery.of(context).size.width * 0.12,
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    const Text(
                      '4445',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.01,
                bottom: MediaQuery.of(context).size.width * 0.04,
              ),
              child: Column(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      CupertinoIcons.bubble_left_fill,
                      size: MediaQuery.of(context).size.width * 0.12,
                    ),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  const Text(
                    '65',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.01,
              ),
              child: Column(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      CupertinoIcons.arrow_turn_up_right,
                      size: MediaQuery.of(context).size.width * 0.12,
                    ),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  const Text(
                    'Share',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                    top: MediaQuery.of(context).size.width * 0.18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '@MauVila',
                          style: TextStyle(
                              color: const Color(0xFFFFFFFF),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        ),
                        Text(
                          ' · 1-28',
                          style: TextStyle(
                            color: const Color(0xFFFFFFFF).withOpacity(0.6),
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '#avicii ',
                                  style: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045,
                                  ),
                                ),
                                Text(
                                  '#wflove ',
                                  style: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.music_note_rounded,
                                  color: Color(0xFFFFFFFF),
                                ),
                                /* Text(
                          'Avicii - Waiting For Love (ft. Licho Aguila y Alcoshit)',
                          style: TextStyle(color: const Color(0xFFFFFFFF),
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                          ),
                        ),*/
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  child: ScrollingText(
                                    text:
                                        'Avicii - Waiting For Love (ft. Licho Aguila y Alcoshit)',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.014,
                            bottom: MediaQuery.of(context).size.width * 0.0,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.width * 0.12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.06,
                              // backgroundImage: NetworkImage('https://example.com/image.jpg'), // Puedes agregar una imagen de fondo si lo deseas
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
