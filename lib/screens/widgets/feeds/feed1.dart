import 'package:flutter/material.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Feed1 extends StatefulWidget {
  @override
  State<Feed1> createState() => _Feed1State();
}

class _Feed1State extends State<Feed1> {
  final videoURL = "https://youtu.be/tVn1sG9Yf88";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    // TODO: implement initState
    _controller = YoutubePlayerController(
        initialVideoId: videoID!, flags: YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.width * 0.8, // Adjust as needed
      // padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/girl1.jpg'),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'A Lifestyle Brand',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Short description about the brand',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  OutlinedButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color.fromARGB(255, 246, 222, 4)),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.zero, // This makes the corners sharp
                      ),
                    ),
                    child: Text(
                      'The Waridi Story Video',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Expanded(
                      child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    liveUIColor: Colors.red,
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
