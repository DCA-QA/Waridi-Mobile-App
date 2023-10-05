import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waridionline/screens/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isFingerPrintOn = false;
  bool isSchemeSwitched = false;

  int listSize = 0;

  final List<String> items = [
    'CBK Test Scheme',
    'NICO Holdings',
    'Pacific Tiers'
  ];
  late String _selectedItem = '';
  // sharePrefs() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  // }
  // late SharedPreferences prefs;
  // Future<void> initSharedPreferences() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  @override
  void initState() {
    super.initState();
    // sharePrefs();
  }

  @override
  Widget build(BuildContext context) {
    // final prefs = SharedPreferencesUtil.sharedPreferences;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.amber,
        title: const Text(
          'Settings',
        ),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text(
              'Common',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            tiles: [
              SettingsTile.navigation(
                leading: const Icon(
                  Icons.language,
                  color: Colors.amber,
                ),
                title: const Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                value: const Text(
                  'English',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  setState(() async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('darkModeEnabled', value);
                  });
                },
                initialValue: false,
                leading: const Icon(
                  Icons.format_paint,
                  color: Colors.amber,
                ),
                title: const Text(
                  'Enable dark mode',
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
          SettingsSection(
            title: const Text(
              'Privacy and safety',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            tiles: [
              SettingsTile(
                title: const Text(
                  'Security',
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                value: const Text(
                  'Fingerprint',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                leading: const Icon(
                  Icons.lock,
                  color: Colors.amber,
                ),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                initialValue: true,
                title: const Text(
                  'Use fingerprint',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                leading: const Icon(
                  Icons.fingerprint,
                  color: Colors.amber,
                ),
                onToggle: (value) {
                  setState(() {
                    // isFingerPrintOn = !isFingerPrintOn;
                    // SharedPreferencesUtil()
                    //     .saveFingerPrintState(isFingerPrintOn);
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            title: const Text(
              'Account',
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
            tiles: [
              SettingsTile.switchTile(
                initialValue: false,
                title: const Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                leading: const Icon(
                  Icons.switch_account,
                  color: Colors.amber,
                ),
                onToggle: (value) {
                  listSize > 1
                      ? _showDialog()
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                'Warning',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              content: const Text(
                                "Sorry,no notifications",
                              ),
                              actions: <Widget>[
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blueGrey),
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                },
              ),
              SettingsTile.switchTile(
                initialValue: false,
                title: const Text(
                  'Holiday wishes',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.amber,
                ),
                onToggle: (value) {
                  setState(() {});
                },
              ),
              SettingsTile.switchTile(
                  initialValue: false,
                  title: const Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.amber,
                  ),
                  onToggle: (value) async {
                    setState(() {});
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    bool? isSessionOn = await prefs.getBool('sessionOn');

                    if (isSessionOn == true) {
                      bool? confirmSignOut =
                          await showConfirmationDialog(context);
                      if (confirmSignOut == true) {
                        await clearUserSession();
                      }
                    }
                  })
            ],
          ),
        ],
      ),
    );
  }

  Future<void> clearUserSession() async {
    // Set sessionOn to false to indicate user is signed out
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('sessionOn', false);
  }

  void _showDialog() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 200,
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          );
        });
  }

  Future<bool?> showConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Sign Out',
          ),
          content: const Text(
            'Are you sure you want to sign out?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // User cancels sign-out
              },
              child: const Text(
                'Cancel',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // User confirms sign-out
              },
              child: const Text(
                'Sign Out',
              ),
            ),
          ],
        );
      },
    );
  }
}
