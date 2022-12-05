import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feed.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "assets/feed_01.jpeg",
      "assets/feed_02.jpeg",
      "assets/feed_03.jpeg",
      "assets/feed_04.jpeg",
      "assets/feed_05.jpeg",
      "assets/feed_06.jpeg",
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Image(
            image: AssetImage("assets/logo.png"),
            height: 32,
          ),
          leading: IconButton(
            icon: const Icon(CupertinoIcons.camera, color: Colors.black),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.paperplane, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            final image = images[index];
            // return Image.network(image);
            print(image);

            // return const Image(
            // image: AssetImage("assets/feed_04.jpeg"),
            // );
            return Feed(
              imageUrl: image,
            );
          },
        ),
      ),
    );
  }
}
