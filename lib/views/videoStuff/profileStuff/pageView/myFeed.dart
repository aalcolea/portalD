import 'package:flutter/material.dart';
import 'package:tiktokgov/views/videoStuff/videoFeed.dart';

import '../../videoPlayer.dart';

class MyFeed extends StatefulWidget {
  const MyFeed({super.key});

  @override
  State<MyFeed> createState() => _MyFeedState();
}

class _MyFeedState extends State<MyFeed> {
  final List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    // Agrega más URLs de videos aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: MediaQuery.of(context).size.width * 0.5,
          crossAxisCount: 3, // Número de columnas en la cuadrícula
          crossAxisSpacing: 1.0, // Espacio horizontal entre elementos
          mainAxisSpacing: 1.0, // Espacio vertical entre elementos
        ),
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoFeed(),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  'https://via.placeholder.com/150x250',
                  // Reemplaza con la miniatura del video
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.width * 0.01,
                  left: MediaQuery.of(context).size.width * 0.01,
                  child: Icon(
                    Icons.play_circle_outlined,
                    size: MediaQuery.of(context).size.width * 0.07,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
