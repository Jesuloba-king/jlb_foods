import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_settings_tile.dart';
import '../themes/theme_provider.dart';

/*


*/

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("S E T T I N G S"),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
//body
      body: Column(
        children: [
//dark mode
          MySettingsTile(
            title: "Dark Mode",
            action: CupertinoSwitch(
              value:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(),
            ),
          ),

          //block user
          // GestureDetector(
          //   // onTap: () => gotoBlockPages(context),
          //   child: MySettingsTile(
          //     title: "Block User",
          //     action: IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         Icons.arrow_forward_ios,
          //         color: Theme.of(context).colorScheme.primary,
          //       ),
          //     ),
          //   ),
          // ),

          // //account settings tile

          // GestureDetector(
          //   // onTap: () => goAccountSettingspage(context),
          //   child: MySettingsTile(
          //     title: "Account Settings",
          //     action: IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         Icons.settings,
          //         color: Theme.of(context).colorScheme.primary,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
