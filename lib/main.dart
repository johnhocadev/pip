








import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pip_view/pip_view.dart';
import 'package:video_player/video_player.dart';

import 'background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String videoUrl =
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  int _counter = 0;
  late VideoPlayerController _controller;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    var videoPlayerController = VideoPlayerController.network(videoUrl)
      ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PIPView(
      floatingHeight: 100,
      floatingWidth: 200,
      builder: (context, isFloating) => CupertinoPageScaffold(

        navigationBar: CupertinoNavigationBar(
          middle: IconButton(
            onPressed: (){
              PIPView.of(context)?.presentBelow(const BackGroundScreen());
            },
            icon: const Icon(Icons.alarm),
          ),
        ),
        child: SafeArea(child: Center(child: CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController),),),

      ),
    );
  }
}



//  Scaffold(
//         appBar: AppBar(

//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           title: Text(widget.title),
//         ),
//         body: CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController),
//         floatingActionButton: FloatingActionButton(
//           onPressed: (){
//              PIPView.of(context)?.presentBelow(const BackGroundScreen());
//           },
//           tooltip: 'Increment',
//           child: const Icon(Icons.add),
//         ),
//       ),