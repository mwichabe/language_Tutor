import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
class Lessons extends StatefulWidget {
  const Lessons({Key? key}) : super(key: key);

  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  bool isDarkMode = false;
  List<String>languages=['Kiswahili','English','French','Spanish','Germany'];
  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [isDarkMode, !isDarkMode];
    List<Widget> children = [
      const Icon(Icons.light_mode, color: Colors.black),
      const Icon(Icons.dark_mode, color: Colors.white),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: miniBackColor,
          onPrimary: primary,
          secondary: secondary,
          onSecondary: onSecondary,
          error: error,
          onError: onError,
          background: background,
          onBackground: onBackground,
          surface: surface,
          onSurface: onSurface,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: onBackground,
          foregroundColor: mainColor,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: mainColor,
          onPrimary: miniBackColor,
          secondary: secondary,
          onSecondary: onSecondary,
          error: error,
          onError: onError,
          background: background,
          onBackground: onBackground,
          surface: surface,
          onSurface: onSurface,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: mainColor,
          foregroundColor: onBackground,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Languages',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            ToggleButtons(
              isSelected: isSelected,
              children: children,
              onPressed: (index) {
                setState(() {
                  isSelected[index] = !isSelected[index];
                  isDarkMode = !isDarkMode;
                });
              },
            ),
          ],
        ),
        body:ListView.builder(
          itemCount: languages.length,
          itemBuilder: (context, index) {
            String language = languages[index];
            return ListTile(
              title: Text(language),
              onTap: () {
                // Handle language selection
              },
            );
          },
        ),
      ),
    );
  }
  }

