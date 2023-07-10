import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found/theme/colors.dart';
import 'package:lost_and_found/theme/constants.dart';

import 'Lessons.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);
  final List<String> imageUrls = [
   Constants.imageUrl1,
    Constants.imageUrl2,
    Constants.imageUrl3,
    Constants.imageUrl4,
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDarkMode = false;

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
          title:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:  const Text(
              'Language Learning Centre',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Language Learning Centre!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:
                        CachedNetworkImage(
                          imageUrl: Constants.imageUrl,
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          height: 200,
                          width: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (_)=> const Lessons()
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                 foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child:  const Text('Start Learning'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
