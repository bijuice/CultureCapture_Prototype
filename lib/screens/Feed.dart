import 'package:flutter/material.dart';
import '../services/posts.dart';

List<Post> posts = [
  Post(
      name: 'Abdul Rahman Rehmtulla',
      likes: '33k',
      url: 'assets/videos/video1.png',
      title: "Kite Festival"),
  Post(
      name: 'Hamisi Rawlins',
      likes: '25k',
      url: 'assets/videos/video2.png',
      title: "Native Amazon Dance"),
  Post(
      name: 'Chao Mbogo',
      likes: '44k',
      url: 'assets/videos/video3.png',
      title: "Zoroastrian Temple Tour")
];

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Tab(
              child: Text('Feed',
                  style: TextStyle(color: Colors.black, letterSpacing: 2)),
            ),
            Tab(
              child: Text('Featured',
                  style: TextStyle(color: Colors.black, letterSpacing: 2)),
            )
          ],
        ),
        body: TabBarView(
          children: [Main(), Featured()],
        ),
      ),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              posts[index].title,
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Image(image: AssetImage(posts[index].url)),
            Text(
              posts[index].likes,
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
            Text(posts[index].name),
            Divider(
              height: 20,
            )
          ],
        );
      },
    );
  }
}

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
