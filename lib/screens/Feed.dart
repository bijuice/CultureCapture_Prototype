import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../services/posts.dart';
import 'Video.dart';

//hardcoded posts
List<Post> _posts = [
  Post(
      name: 'Abdul Rahman Rehmtulla',
      likes: '33k',
      url: 'assets/videos/video1.png',
      vidUrl: 'assets/videos/video1.mp4',
      title: "Kite Festival",
      avatar: 'assets/images/me.jpg'),
  Post(
      name: 'Hamisi Rawlins',
      likes: '25k',
      url: 'assets/videos/video2.png',
      vidUrl: 'assets/videos/video2.mp4',
      title: "Native Amazon Dance",
      avatar: 'assets/images/rolo.png'),
  Post(
      name: 'Chao Mbogo',
      likes: '44k',
      url: 'assets/videos/video3.png',
      vidUrl: 'assets/videos/video3.mp4',
      title: "Zoroastrian Temple Tour",
      avatar: 'assets/images/chao.png'),
  Post(
      name: 'For You Chinese Resaturant',
      likes: '1.2K',
      url: 'assets/videos/video4.png',
      vidUrl: 'assets/videos/video4.mp4',
      title: "Authentic Chinese Food in Nairobi",
      avatar: 'assets/images/foryou.jpg')
];

List<String> tags = [
  'Africa',
  'Wedding',
  'Dance',
  'Music',
  'Food',
  'Festival',
];

//Entire homepage feed
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
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold)),
            ),
            Tab(
              child: Text('Featured',
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold)),
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

//Feed tab
class Main extends StatelessWidget {
  //function for selecting videos
  void goToVideo(context, index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Video(
                  name: _posts[index].name,
                  likes: _posts[index].likes,
                  url: _posts[index].url,
                  title: _posts[index].title,
                  avatar: _posts[index].avatar,
                  vidUrl: _posts[index].vidUrl,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          height: 30,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tags.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text(
                        tags[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 8,
        ),
        Divider(
          height: 2,
          thickness: 2,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            _posts[index].title,
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          goToVideo(context, index);
                        },
                        child: Image(image: AssetImage(_posts[index].url))),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          _posts[index].likes,
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(_posts[index].avatar),
                            radius: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            _posts[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.grey[300],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

//featured tab
class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage('assets/images/ghana.png')),
        Text('What You Ghana Do When They Come For You?',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
          child: Text(
            'This week we travel to Ghana and take a look at the various tribes and cultures from this African country. We’ll put on our “Kente” and head to a “Mole-Dagbani” wedding, have a taste of “Fufu”, and dance to the beat of the “Akan” drum',
            style: TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}
