import 'dart:ui';
import 'package:advmobprog_midterms_tp02_amarille/widgets/grid_painter.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:advmobprog_midterms_tp02_amarille/services/slam_data_services.dart';
import 'models/friend.dart';
import 'widgets/friend_slam_card.dart';

void main() {
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class DesktopScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}

const Color sageGreen = Color(0xFFA7D2B7);
const Color headerPink = Color(0xFFFFB7B7);
const Color offWhite = Color(0xFFFFFDF7);

ThemeData getSlamBookTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: sageGreen,
      tertiary: headerPink,
      surface: offWhite,
    ),
    scaffoldBackgroundColor: offWhite,
    cardTheme: CardThemeData(
      elevation: 4,
      color: sageGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFF2C2C2C), width: 2),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.permanentMarker(
        fontSize: 32,
        color: const Color(0xFF2C2C2C),
      ),
      titleMedium: GoogleFonts.patrickHand(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF2C2C2C),
      ),
      bodyMedium: GoogleFonts.patrickHand(
        fontSize: 18,
        color: const Color(0xFF2C2C2C),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SlamBook',
      debugShowCheckedModeBanner: false,
      theme: getSlamBookTheme(),
      scrollBehavior: DesktopScrollBehavior(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Friend>> _friendsFuture;
  final PageController _pageController = PageController(viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
    _friendsFuture = SlamDataService.loadFriends();
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _prevPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: GridPainter(
                  gridColor: Colors.lightBlue.withOpacity(0.15),
                  spacing: 24.0,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: -20,
            child: IgnorePointer(
              child: Transform.rotate(
                angle: -0.2,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: headerPink.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: -30,
            child: IgnorePointer(
              child: Transform.rotate(
                angle: 0.2,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: sageGreen.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),

                Transform.rotate(
                  angle: -0.05,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 3),
                      boxShadow: const [
                        BoxShadow(color: Colors.black, offset: Offset(4, 4)),
                      ],
                    ),
                    child: Text(
                      'MY SLAMBOOK',
                      style: GoogleFonts.permanentMarker(
                        fontSize: 28,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: FutureBuilder<List<Friend>>(
                    future: _friendsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(color: sageGreen),
                        );
                      }

                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Oops! Check your JSON.",
                            style: GoogleFonts.patrickHand(fontSize: 20),
                          ),
                        );
                      }

                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        final friends = snapshot.data!;

                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            PageView.builder(
                              controller: _pageController,
                              clipBehavior: Clip.none,
                              itemCount: friends.length,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: FriendSlamCard(
                                        friend: friends[index],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),

                            Positioned(
                              left: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: _prevPage,
                                  icon: const Icon(Icons.arrow_back_ios_new),
                                  color: Colors.black87,
                                  tooltip: "Previous Friend",
                                ),
                              ),
                            ),

                            Positioned(
                              right: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: _nextPage,
                                  icon: const Icon(Icons.arrow_forward_ios),
                                  color: Colors.black87,
                                  tooltip: "Next Friend",
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return const Center(child: Text("Empty Book!"));
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
