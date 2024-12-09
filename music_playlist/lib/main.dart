import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MusicPlaylistApp());

class MusicPlaylistApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  final String sampleUrl = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';

  Future<void> playSong() async {
    await audioPlayer.play(UrlSource(sampleUrl));
  }

  Future<void> pauseSong() async {
    await audioPlayer.pause();
  }

  Future<void> stopSong() async {
    await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Music Playlist App')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: playSong,
            ),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: pauseSong,
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: stopSong,
            ),
          ],
        ),
      ),
    );
  }
}
