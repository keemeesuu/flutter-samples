import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Feed Image
        Container(
          constraints: const BoxConstraints(
            maxWidth: double.infinity,
            minHeight: 200,
            maxHeight: 300,
          ),
          child: Image(
            image: AssetImage(widget.imageUrl),
            width: double.infinity,
            fit: BoxFit.cover,
            //width: double.infinity,
          ),
        ),

        // Feed Icons(Like, Comment, Bookmark)
        Row(
          children: [
            IconButton(
              icon: Icon(
                CupertinoIcons.heart,
                color: isLike ? Colors.red : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  // setState 안쪽 코드 실행후 화면 갱신
                  // setState() 호출 시 StatefulWidget의 build()함수를 호출해 화면을 갱신시켜 준다.
                  isLike = !isLike;
                });
              },
            ),
            IconButton(
              icon: const Icon(CupertinoIcons.chat_bubble),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(CupertinoIcons.bookmark),
              onPressed: () {},
            ),
          ],
        ),

        // Feed Like
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            "2 likes",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Fedd Text
        const Padding(
          padding: EdgeInsets.only(left: 10.0, top: 10),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non elit efficitur neque consectetur porta. In a feugiat massa, ac pulvinar lacus. Donec auctor nisi vitae dui mollis sagittis. Sed consectetur rhoncus neque, ut cursus massa convallis vel. Nunc sed erat dignissim, viverra ex ut, semper orci. Phasellus dapibus eleifend venenatis. Quisque viverra scelerisque nulla, vel egestas risus pharetra sed.",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),

        // Date
        const Padding(
          padding: EdgeInsets.only(left: 10.0, top: 20, bottom: 40),
          child: Text(
            "NOVEMBER 29",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
