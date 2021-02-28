import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:expandable/expandable.dart';
import 'package:cc_prototype/services/comments.dart';

class Video extends StatefulWidget {
  final String name, avatar, likes, url, title, vidUrl;

  Video(
      {this.name, this.likes, this.url, this.title, this.avatar, this.vidUrl});

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  static String lorem = 'Captain Jinglebells';
  static String ipsum =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur feugiat nulla quis nulla sollicitudin hendrerit. Ut volutpat pharetra felis, vel lobortis ipsum malesuada in. Sed efficitur suscipit euismod. Mauris ligula dui, dictum id purus sit amet, semper ullamcorper dolor. Fusce turpis mauris, vehicula in scelerisque non, ultrices eget nibh. Morbi sagittis efficitur malesuada. Sed venenatis, lacus a tincidunt sodales, diam odio efficitur leo, quis lacinia odio felis nec urna. Fusce nec nisl velit. Vivamus nec aliquam mauris. Vestibulum eget dignissim augue. Nunc convallis consequat tortor, quis gravida augue luctus id. In non tempor augue, sed molestie purus.';

  List<Comments> comments = [
    Comments(user: lorem, comment: ipsum),
    Comments(user: lorem, comment: ipsum),
    Comments(user: lorem, comment: ipsum),
    Comments(user: lorem, comment: ipsum),
  ];

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.asset(widget.vidUrl);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: false,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  //implement checking wether video has loaded in final version
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  ),
                ),
                ExpandableNotifier(
                    child: Card(
                  clipBehavior: Clip.none,
                  child: Column(
                    children: [
                      ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: false,
                        child: ExpandablePanel(
                          header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.title,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.likes,
                                      style: TextStyle(
                                          fontSize: 16,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left,
                                    ),
                                    Expanded(child: Container()),
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage(widget.avatar),
                                      radius: 15,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          expanded: SizedBox(
                            height: 300,
                            child: Container(
                              child: Text(
                                'Accessibility Features Placeholder',
                                style: TextStyle(fontSize: 30),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.rectangle),
                            ),
                          ),
                          builder: (_, collapsed, expanded) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Expandable(
                                collapsed: collapsed,
                                expanded: expanded,
                                theme: const ExpandableThemeData(
                                    crossFadePoint: 0),
                              ),
                            );
                          },
                        ),
                      ),
                      Divider(
                        height: 2,
                        thickness: 2,
                      ),
                    ],
                  ),
                )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 5, 10),
                    child: Text(
                      'Comments',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: 400,
                child: ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              comments[index].user,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(comments[index].comment),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
