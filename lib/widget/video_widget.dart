import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String path;

  VideoWidget(this.path);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  ChewieController _chewieController;
  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.path);
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 3 / 2,
        autoPlay: true,
        autoInitialize: true,
        looping: true,
        showControls: false);
  }

  @override
  void dispose() {
    super.dispose();
    if (_chewieController != null) {
      _chewieController.dispose();
    }
    if (_videoPlayerController != null) {
      _videoPlayerController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      key: Key(widget.path),
      controller: _chewieController,
    );
  }
}
