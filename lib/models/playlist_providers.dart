import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
// here we import thta song class
  final List<Song> _playlist = [
    //song 1
    Song(
        songName: "Balagal Ola Bykamal",
        artistName: "Ali Zafer",
        albumArtImagepath: "assets/Ali zafer.jpeg",
        audioPath: "assets/Balagal ola bykamal.mp3"),

    //song 2
    Song(
        songName: "Ertugrul Theme Music",
        artistName: "Alpay Göktekin.",
        albumArtImagepath: "assets/Ertugrul.jpeg",
        audioPath: "assets/Ertugrul Tone.mp3"),

    //song 3
    Song(
        songName: "Myry Bad Tum Kis Ko Stao Gay",
        artistName: "Nusrat Fateh Ali Khan",
        albumArtImagepath: "assets/Nusrat pic.jpeg",
        audioPath: "Nusrat Fatah Ali.mp3"),
  ];

  // current song playing index

  int? _currentSongIndex;

  // G E T T E R S

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  // S E T T E R S

  set currentSongIndex(int? newIndex) {
    // update current songn index
    _currentSongIndex = newIndex;
    // update UI
    notifyListeners();
  }
}
