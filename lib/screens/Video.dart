import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:expandable/expandable.dart';

class Video extends StatefulWidget {
  final String name, avatar, likes, url, title, vidUrl;

  List<String> comments = ['Really cool!', ''];

  Video(
      {this.name, this.likes, this.url, this.title, this.avatar, this.vidUrl});

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

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
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                                  style: TextStyle(fontSize: 16),
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
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
                                  backgroundImage: AssetImage(widget.avatar),
                                  radius: 15,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      expanded: SizedBox(
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.amber, shape: BoxShape.rectangle),
                        ),
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                            theme: const ExpandableThemeData(crossFadePoint: 0),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(
                    height: 15,
                    thickness: 2,
                  ),
                  Container(
                    child: Text('Comments'),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
