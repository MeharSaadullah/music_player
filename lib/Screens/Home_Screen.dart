import 'package:flutter/material.dart';
import 'package:music_player/Components/my_drawer.dart';
import 'package:music_player/Screens/Song_Screen.dart';
import 'package:provider/provider.dart';
import 'package:music_player/models/playlist_Providers.dart';
import 'package:music_player/models/song.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // get playlist provider
  late final dynamic playlistProvider;
  //final playlistProvider = Provider.of<PlaylistProvider>(context);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //get playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  // go to song
  void goToSong(int songIndex) {
    // update current song index
    playlistProvider.currentSongIndex = songIndex;
    // Navigate to song Screen
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SongScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text('P L A Y L I S T'),
        ),
        drawer: MyDrawer(),
        body: Consumer<PlaylistProvider>(
          builder: (context, value, child) {
            // get the playlist
            final List<Song> playlist = value.playlist;

            // return list view UI
            return ListView.builder(
                itemCount: playlist.length,
                itemBuilder: (context, index) {
                  // get indiviual song
                  final Song song = playlist[index];

                  // return list tile Ui
                  return ListTile(
                      title: Text(
                        song.songName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(song.artistName),
                      leading: Image.asset(song.albumArtImagepath),
                      onTap: () => goToSong(index));
                });
          },
        ));
  }
}
