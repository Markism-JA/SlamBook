import 'package:advmobprog_midterms_tp02_amarille/widgets/group_selfie_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/friend.dart';
import 'portrait_section.dart';
import 'zodiac_section.dart';
import 'hobby_section.dart';
import 'color_section.dart';
import 'food_section.dart';
import 'media_section.dart';
import 'package:colornames/colornames.dart';

class FriendSlamCard extends StatelessWidget {
  final Friend friend;

  const FriendSlamCard({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 950),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 650;

              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFA7D2B7),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: const Color(0xFF2C2C2C),
                    width: 2.5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(6, 6),
                      blurRadius: 4,
                    ),
                  ],
                ),
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          margin: const EdgeInsets.only(bottom: 24),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFDF7).withOpacity(0.3),
                            border: Border.all(
                              color: const Color(0xFFEF9A9A),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'ALL ABOUT ${friend.nickname.toUpperCase()}',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.permanentMarker(
                              fontSize: 28,
                              color: const Color(0xFF2C2C2C),
                            ),
                          ),
                        ),

                        Flex(
                          direction: isMobile ? Axis.vertical : Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildResponsiveChild(
                              isMobile: isMobile,
                              child: Column(
                                children: [
                                  PortraitSection(
                                    fullName: friend.name,
                                    nickname: friend.nickname,
                                    imagePath: friend.imageUrl,
                                    birthday: friend.birthday,
                                    age: friend.age,
                                  ),
                                  const SizedBox(height: 16),
                                  ZodiacSection(zodiac: friend.zodiacSign),
                                  const SizedBox(height: 16),
                                  HobbySection(hobby: friend.hobby),
                                  if (!isMobile) ...[
                                    const SizedBox(height: 16),
                                    GroupSelfieSection(
                                      imagePath: friend.selfie1,
                                      rotation: -0.02,
                                    ),
                                  ],
                                ],
                              ),
                            ),

                            SizedBox(
                              width: isMobile ? 0 : 20,
                              height: isMobile ? 20 : 0,
                            ),

                            _buildResponsiveChild(
                              isMobile: isMobile,
                              child: Column(
                                children: [
                                  FavColorSection(
                                    favColor: friend.favColor,
                                    colorName: friend.favColor.colorName,
                                  ),
                                  const SizedBox(height: 16),
                                  FavFoodSection(
                                    foodName: friend.food,
                                    imagePath: friend.foodImagePath,
                                  ),
                                  const SizedBox(height: 16),
                                  MediaSection(
                                    title: friend.movie,
                                    imagePath: friend.movieImage,
                                    rotation: -0.02,
                                  ),
                                  const SizedBox(height: 16),
                                  MediaSection(
                                    title: friend.song,
                                    imagePath: friend.songImagePath,
                                    rotation: 0.02,
                                  ),
                                  if (!isMobile) ...[
                                    const SizedBox(height: 16),
                                    GroupSelfieSection(
                                      imagePath: friend.selfie2,
                                      rotation: 0.02,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),

                        if (isMobile) ...[
                          const SizedBox(height: 30),
                          Divider(
                            color: Colors.black.withOpacity(0.1),
                            thickness: 2,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "MEMORIES",
                            style: GoogleFonts.permanentMarker(fontSize: 22),
                          ),
                          const SizedBox(height: 15),
                          GroupSelfieSection(
                            imagePath: friend.selfie1,
                            rotation: -0.01,
                          ),
                          const SizedBox(height: 20),
                          GroupSelfieSection(
                            imagePath: friend.selfie2,
                            rotation: 0.01,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildResponsiveChild({
    required bool isMobile,
    required Widget child,
  }) {
    if (isMobile) {
      return SizedBox(width: double.infinity, child: child);
    }
    return Expanded(child: child);
  }
}
