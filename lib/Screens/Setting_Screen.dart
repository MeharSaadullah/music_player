import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Themes/Theme_Providers.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(" S E T T I N G S"),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(16),
        margin: EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Dark Mode
            const Text(
              'DARK MODE',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            //SWITCH
            CupertinoSwitch(
              value: Provider.of<ThemeProviders>(context, listen: false)
                  .isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemeProviders>(context, listen: false)
                      .toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}
