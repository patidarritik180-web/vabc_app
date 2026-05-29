import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                /// =========================
                /// HEADER
                /// =========================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "Good morning",

                          style: GoogleFonts.sora(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),

                        Text(
                          "Alex Mercer",

                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: 42,
                      height: 42,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),

                      child: const Icon(Icons.notifications_none),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// =========================
                /// TOP CARD
                /// =========================
                Container(
                  height: 180,
                  width: double.infinity,

                  clipBehavior: Clip.hardEdge,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: const Color(0xFF2A2A2A),
                  ),

                  child: Stack(
                    children: [
                      /// ORANGE BLUR
                      Positioned(
                        right: -70,
                        top: -10,

                        child: Container(
                          width: 260,
                          height: 260,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            gradient: RadialGradient(
                              colors: [
                                const Color(0xFFFF7A1A).withOpacity(0.3),

                                const Color(0xFFFF7A1A).withOpacity(0.1),

                                Colors.transparent,
                              ],

                              stops: const [0.2, 0.55, 1],
                            ),
                          ),
                        ),
                      ),

                      /// CONTENT
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              "Tuesday, 6 May",

                              style: GoogleFonts.sora(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              "VERA Pendant",

                              style: GoogleFonts.sora(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 24),

                            /// BLUETOOTH CARD
                            Container(
                              width: double.infinity,
                              height: 58,

                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                              ),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),

                                border: Border.all(
                                  color: const Color(
                                    0xFFFF6B2C,
                                  ).withOpacity(0.4),
                                ),

                                color: const Color(
                                  0xFFFF6B2C,
                                ).withOpacity(0.08),
                              ),

                              child: Row(
                                children: [
                                  /// GREEN DOT
                                  Container(
                                    width: 10,
                                    height: 10,

                                    decoration: BoxDecoration(
                                      color: Colors.green,

                                      shape: BoxShape.circle,

                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green.withOpacity(0.7),

                                          blurRadius: 15,
                                          spreadRadius: 3,
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,

                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          "VERA Mic Pro",

                                          style: GoogleFonts.sora(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(height: 2),

                                        Text(
                                          "Connected via Bluetooth",

                                          style: GoogleFonts.sora(
                                            fontSize: 10,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const Icon(
                                    Icons.battery_4_bar,
                                    color: Colors.white,
                                  ),

                                  const SizedBox(width: 4),

                                  Text(
                                    "82%",

                                    style: GoogleFonts.dmSans(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// =========================
                /// GRID
                /// =========================
                GridView.count(
                  shrinkWrap: true,

                  physics: const NeverScrollableScrollPhysics(),

                  crossAxisCount: 2,

                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,

                  childAspectRatio: 1.45,

                  children: [
                    buildStatCard(
                      "assets/images/homemic.png",
                      "Recordings",
                      "47",
                    ),

                    buildStatCard(
                      "assets/images/homebook.png",
                      "Audio Captured",
                      "12.4h",
                    ),

                    buildStatCard(
                      "assets/images/homechat.png",
                      "AI Chats",
                      "234",
                    ),

                    buildStatCard(
                      "assets/images/homebrain.png",
                      "Memories",
                      "1,284",
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                /// =========================
                /// BUTTON
                /// =========================
                SizedBox(
                  width: double.infinity,
                  height: 58,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B35),

                      elevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    onPressed: () {},

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Container(
                          width: 10,
                          height: 10,

                          decoration: BoxDecoration(
                            color: Colors.white,

                            shape: BoxShape.circle,

                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.8),

                                blurRadius: 12,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 10),

                        Text(
                          "Start Recording",

                          style: GoogleFonts.sora(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(width: 8),

                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                /// =========================
                /// RECENT HEADER
                /// =========================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      "Recent",

                      style: GoogleFonts.sora(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "View all",

                      style: GoogleFonts.sora(
                        fontSize: 11,
                        color: const Color(0xFFFF6B35),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                /// RECENT CARD 1
                buildRecentCard(
                  "assets/images/group.png",
                  "Q3 Strategy Sync",
                  "Today · 42 min · 5 people",
                  showWave: true,
                ),

                const SizedBox(height: 16),

                /// RECENT CARD 2
                buildRecentCard(
                  "assets/images/homecall.png",
                  "Call · Lorem Chen",
                  "Yesterday · 10:30am · 18 min",
                ),

                const SizedBox(height: 16),

                /// RECENT CARD 3
                buildRecentCard(
                  "assets/images/home.png",
                  "User Interview — Priya M.",
                  "May 4 · 11:50am · 18 min",
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// =========================
  /// GRID CARD
  /// =========================

  Widget buildStatCard(String imagePath, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(24),

        border: Border.all(color: const Color(0xFFEAEAEA)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Image.asset(imagePath, width: 18, height: 18),

          const Spacer(),

          Text(
            title,

            style: GoogleFonts.sora(
              color: const Color(0xFF7B8190),
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            value,

            style: GoogleFonts.sora(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
          ),
        ],
      ),
    );
  }

  /// =========================
  /// RECENT CARD
  /// =========================

  Widget buildRecentCard(
    String imagePath,
    String title,
    String subtitle, {
    bool showWave = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),

        border: Border.all(color: const Color(0xFFEAEAEA)),
      ),

      child: Column(
        children: [
          Row(
            children: [
              /// LEFT ICON
              Center(
                child: Image.asset(
                  imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(width: 1),

              /// TEXTS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      title,

                      style: GoogleFonts.sora(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF222222),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      subtitle,

                      style: GoogleFonts.sora(
                        fontSize: 11,
                        color: const Color(0xFF7B8190),
                        letterSpacing: 0.44,
                      ),
                    ),
                  ],
                ),
              ),

              /// PLAY BUTTON
              Container(
                width: 24,
                height: 24,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  border: Border.all(color: const Color(0xFFFF6B35), width: 2),
                ),

                child: const Icon(
                  Icons.play_arrow_outlined,
                  color: Color(0xFFFF6B35),
                  size: 18,
                ),
              ),
            ],
          ),

          if (showWave) ...[
            const SizedBox(height: 10),

            Align(
              alignment: Alignment.centerLeft,

              child: Image.asset("assets/images/lines.png", height: 30),
            ),
          ],
        ],
      ),
    );
  }
}
