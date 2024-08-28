import 'package:flutter/material.dart';
import 'package:music_player/Components/Song_Box.dart';
import 'package:music_player/models/playlist_providers.dart';
import 'package:provider/provider.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  // get playlist provider
  late final dynamic playlistProvider;

  // final playlistProvider = Provider.of<PlaylistProvider>(context);
  void initState() {
    // TODO: implement initState
    super.initState();

    //get playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    //final playlistProvider =
    //Provider.of<PlaylistProvider>(context, listen: false);

    // here we use consumer to get the data of playlist provider
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
// get playlist

//       final playlist = value.playlist?.toList() ?? [];

// // get current song index

//       final currentSong = playlist[value.currentSongIndex ?? 0];

      // Get playlist
      final playlist = playlistProvider.playlist?.toList() ?? [];

      // Get current song index
      final currentSong = playlist[playlistProvider.currentSongIndex ?? 0];

      // return scaffold ui
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // app bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // back button
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back)),

                    // title
                    Text(
                      "M E D I A  S C R E E N",
                      style: TextStyle(fontSize: 20),
                    ),

                    //menu bar

                    IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                  ],
                ),

                // album artwork
                SongBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset("assets/Ertugrul.jpeg",
                            // child: Image.asset("assets/Nusrat pic.jpeg",
                            //child: Image.asset("assets/Ali zafer.jpeg",
                            //  child: Image.asset(currentSong.albumArtImagepath,
                            width: 490,
                            height: 290,
                            fit: BoxFit.cover),
                      ),
                      // song and artist name and icon
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Ertugrul Theme Music",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text("Alpay Göktekin")
                                //  Text(currentSong.artistName),
                              ],
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //song duration progress
                Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // start time
                          Text("0.00"),

                          // shuffle item
                          Icon(Icons.shuffle),

                          // repeat time
                          Icon(Icons.repeat),

                          //end time
                          Text("0.00"),
                        ],
                      ),
                    ),
                    Slider(
                        min: 0,
                        max: 100,
                        value: 50,
                        activeColor: Colors.black,
                        onChanged: (value) {})
                  ],
                ),

                const SizedBox(
                  height: 25,
                ),
                //playback controls
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: SongBox(
                          child: Icon(Icons.skip_previous),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {},
                        child: SongBox(
                          child: Icon(Icons.play_arrow),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: SongBox(
                          child: Icon(Icons.skip_next),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
