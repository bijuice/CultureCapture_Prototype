import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final String name, avatar, likes, url, title, vidUrl;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Center(child: Text(widget.title)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Center(
            //implement checking wether video has loaded in final version
            child: Chewie(
              controller: _chewieController,
            ),
          )),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
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
                    widget.likes,
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
                      backgroundImage: AssetImage(widget.avatar),
                      radius: 15,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(
            height: 30,
            Container()
          )
            ],
          ),
          
        ],
      ),
    );
  }
}
