import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 홈페이지 보여주기
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // image data list
    List<Map<String, dynamic>> dataList = [
      {
        "category": "도쿄",
        "imgUrl": "assets/tokyo.png",
      },
      {
        "category": "오사카",
        "imgUrl": "assets/osaka.jpg",
      },
      {
        "category": "교토",
        "imgUrl": "assets/kyoto.jpg",
      },
      {
        "category": "오키나와",
        "imgUrl": "assets/okinawa.jpg",
      },
      {
        "category": "구마모토",
        "imgUrl": "assets/kumamoto.jpg",
      },
      {
        "category": "삿포로",
        "imgUrl": "assets/sapporo.jpg",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // remove the shadow
        centerTitle: false, // center alignment of the title
        iconTheme:
            const IconThemeData(color: Colors.black), // app bar icons color
        title: const Text(
          "Traveling",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('go my page');
            },
            icon: const Icon(
              Icons.person_outline,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "여행지를 입력해주세요.",
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    print('돋보기 아이콘 클릭');
                  },
                ),
              ),
            ),
          ),
          const Divider(height: 1),
          // category list
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              // itemCount 만큼 반복되며 화면에 보여주려는 위젯
              // index가 0부터 dataList.length -1까지 증가하며 전달됩니다.
              itemBuilder: (context, index) {
                // dataList에서 index에 해당하는 data 꺼내기
                Map<String, dynamic> data = dataList[index];
                String category = data["category"];
                String imgUrl = data["imgUrl"];

                // 카드 형태의 위젯
                return Card(
                  margin: const EdgeInsets.all(8),
                  // 위젯들을 위로 중첩하기 위해 Stack위젯 사용
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // background image
                      Image(
                        image: AssetImage(imgUrl),
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                      ),

                      // opacity text box (cover)
                      Container(
                        width: double.infinity,
                        height: 120,
                        color: Colors.black.withOpacity(0.5),
                      ),

                      // category
                      Text(
                        category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Drawer 윗 부분
            DrawerHeader(
              margin: const EdgeInsets.all(0),
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/hilda_profile.jpg"),
                    ),
                    // 닉네임 상단 여백
                    SizedBox(
                      height: 16,
                    ),
                    // 닉네임
                    Text(
                      "nickname",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // 이메일
                    Text(
                      "hello@world.com",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 이벤트 베너
            // 특정 비율로 위젯 보여주기
            AspectRatio(
              aspectRatio: 12 / 4, // 가로 : 세로 = 12 : 4
              // 이벤트 배너 리스트
              // 스크롤을 할때 즉정 항목이 스냅이 걸리도록 함
              child: PageView(
                children: const [
                  Image(
                    image: AssetImage("assets/banner.jpg"),
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image: AssetImage("assets/banner.jpg"),
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image: AssetImage("assets/banner.jpg"),
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image: AssetImage("assets/banner.jpg"),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            // 구매내역
            ListTile(
              title: const Text(
                'Wish List',
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onTap: () {
                // 클릭시 drawer 닫기
                Navigator.pop(context);
              },
            ),
            // 레시피 공유하기
            ListTile(
              title: const Text(
                'Wish List 2',
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
