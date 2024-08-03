import 'package:flutter/material.dart';
import 'package:netflix_app/screens/widgets/widgets.dart';
import '../../models/models.dart';
import 'package:video_player/video_player.dart';

class ContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;

  const ContentHeaderDesktop({super.key, required this.featuredContent});

  @override
  State<ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<ContentHeaderDesktop> {
  late VideoPlayerController _videoPlayerController;
  bool _isMuted = true;
  bool isPlay = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.featuredContent.videoUrl ?? ""))
      ..initialize().then((_) => setState(() {}))
      ..setVolume(0)
      ..play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _videoPlayerController.value.isPlaying
            ? _videoPlayerController.pause()
            : _videoPlayerController.play();
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
              aspectRatio: _videoPlayerController.value.isInitialized
                  ? _videoPlayerController.value.aspectRatio
                  : 2.344,
              child: _videoPlayerController.value.isInitialized
                  ? VideoPlayer(_videoPlayerController)
                  : Image.asset(
                      widget.featuredContent.imageUrl ?? "",
                      fit: BoxFit.cover,
                    )),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1.0,
            child: AspectRatio(
              aspectRatio: _videoPlayerController.value.isInitialized
                  ? _videoPlayerController.value.aspectRatio
                  : 2.344,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                ),
              ),
            ),
          ),
          Positioned(
            left: 60.0,
            right: 60.0,
            bottom: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Image.asset(
                    widget.featuredContent.titleImageUrl ?? "",
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  widget.featuredContent.description ?? "",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(2.0, 4.0),
                            blurRadius: 6.0)
                      ]),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  PlayButton(
                    label: isPlay ? "Play" : "Pause",
                    icon: isPlay ? Icons.pause : Icons.play_arrow,
                    onTap: () {
                      setState(() {
                        debugPrint("isplay, $isPlay");
                        isPlay = !isPlay;
                        if (isPlay) {
                          _videoPlayerController.play();
                        } else {
                          _videoPlayerController.pause();
                        }
                      });
                    },
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  FlatButton(
                    width: 125,
                    text: "More Info",
                    iconData: Icons.info_outline,
                    bgColor: Colors.white,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  if (_videoPlayerController.value.isInitialized)
                    IconButton(
                      icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () {
                        setState(() {
                          _isMuted
                              ? _videoPlayerController.setVolume(100)
                              : _videoPlayerController.setVolume(0);
                          _isMuted = _videoPlayerController.value.volume == 0;
                        });
                      },
                    )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
