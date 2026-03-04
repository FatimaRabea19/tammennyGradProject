











/*
import 'package:flutter/material.dart';

enum BreathingStep {
  relax,
  sleep,
  startFresh,
}

class MindfulBreathingScreen extends StatefulWidget {
  const MindfulBreathingScreen({super.key});

  @override
  State<MindfulBreathingScreen> createState() =>
      _MindfulBreathingScreenState();
}

class _MindfulBreathingScreenState extends State<MindfulBreathingScreen> {
  BreathingStep step = BreathingStep.relax;

  /// ================= COLORS =================

  Color get backgroundColor {
    switch (step) {
      case BreathingStep.sleep:
        return const Color(0xff1B3C53);
      case BreathingStep.startFresh:
        return const Color(0xffFBAE47);
      case BreathingStep.relax:
      default:
        return const Color(0xffDDD1C9);
    }
  }

  Color get textColor {
    switch (step) {
      case BreathingStep.startFresh:
        return const Color(0xffB47E37);
      case BreathingStep.sleep:
        return Colors.white;
      default:
        return const Color(0xff1B3C53);
    }
  }

  Color get buttonColor {
    switch (step) {
      case BreathingStep.sleep:
        return const Color(0xffDDD1C9);
      case BreathingStep.startFresh:
        return const Color(0xffFBAE47);
      default:
        return const Color(0xff1B3C53);
    }
  }

  Color get buttonTextColor {
    return step == BreathingStep.sleep
        ? const Color(0xff1B3C53)
        : Colors.white;
  }

  /// ================= CONTENT =================

  String get title {
    switch (step) {
      case BreathingStep.sleep:
        return "Sleep better";
      case BreathingStep.startFresh:
        return "Start fresh";
      default:
        return "Relax & unwind";
    }
  }

  String get description {
    switch (step) {
      case BreathingStep.sleep:
        return "This deep relaxing breathing exercise helps you get calm "
            "and fall asleep within minutes.\n"
            "Take 1 min 54 sec";
      case BreathingStep.startFresh:
        return "This breathing exercise gets you ready for the day "
            "feeling refreshed and relaxed.\n"
            "Take 54 sec";
      default:
        return "Improve your performance and connection with the "
            "breathing exercise, you’ll end up feeling relaxed "
            "and more focused.\n"
            "Take 1 min 36 sec for practice";
    }
  }

  /// ================= NAV =================

  void onContinue() {
    setState(() {
      if (step == BreathingStep.relax) {
        step = BreathingStep.sleep;
      } else if (step == BreathingStep.sleep) {
        step = BreathingStep.startFresh;
      } else {
        Navigator.pop(context);
      }
    });
  }

  void onBack() {
    setState(() {
      if (step == BreathingStep.startFresh) {
        step = BreathingStep.sleep;
      } else if (step == BreathingStep.sleep) {
        step = BreathingStep.relax;
      } else {
        Navigator.pop(context);
      }
    });
  }

  /// ================= UI =================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: onBack,
        ),
      ),

      body: Stack(
        children: [
          /// Mountains
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 220,
              child: CustomPaint(
                painter: MountainPainter(step),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                /// ICON SHAPE
                Center(child: _topShape()),

                const SizedBox(height: 78),

                Text(
                  title,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  description,
                  style: TextStyle(
                    fontSize: 26,
                    height: 1.4,
                    color: textColor,
                  ),
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: SizedBox(
                    width: 255,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        foregroundColor: buttonTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: onContinue,
                      child: Text(
                        step == BreathingStep.startFresh
                            ? "Back to Exercises"
                            : "Continue",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ================= SHAPES =================

  Widget _topShape() {
    switch (step) {
      case BreathingStep.sleep:
        return const Icon(Icons.nightlight_round,
            size: 120, color: Colors.white);
      case BreathingStep.startFresh:
        return Container(
          width: 120,
          height: 60,
          decoration: const BoxDecoration(
            color: Color(0xffEA980A),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(120),
            ),
          ),
        );
      default:
        return Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        );
    }
  }
}

/// ================= MOUNTAINS =================

class MountainPainter extends CustomPainter {
  final BreathingStep step;

  MountainPainter(this.step);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint();
    Paint paint2 = Paint();

    if (step == BreathingStep.relax) {
      paint1.color = const Color(0xffD2C1B6);
      paint2.color = const Color(0xff817979);
    } else if (step == BreathingStep.sleep) {
      paint1.color = const Color(0xff162732);
      paint2.color = const Color(0xff0E1C25);
    } else {
      paint1.color = const Color(0xffB47E37);
      paint2.color = const Color(0xffB96F0C);
    }

    Path path1 = Path()
      ..moveTo(0, size.height * 0.5)
      ..quadraticBezierTo(
          size.width * 0.3, size.height * 0.2, size.width * 0.6, size.height * 0.5)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    Path path2 = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(
          size.width * 0.4, size.height * 0.4, size.width, size.height * 0.7)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
*/


























/*

import 'package:flutter/material.dart';

enum BreathingStep {
  relax,
  sleep,
  startFresh,
}

class MindfulBreathingScreen extends StatefulWidget {
  const MindfulBreathingScreen({super.key});

  @override
  State<MindfulBreathingScreen> createState() =>
      _MindfulBreathingScreenState();
}

class _MindfulBreathingScreenState extends State<MindfulBreathingScreen> {
  BreathingStep step = BreathingStep.relax;

  // ================= COLORS =================

  Color get backgroundColor {
    switch (step) {
      case BreathingStep.sleep:
        return const Color(0xff1B3C53);
      case BreathingStep.startFresh:
        return const Color(0xffFBAE47);
      default:
        return const Color(0xffDDD1C9);
    }
  }

  Color get textColor {
    switch (step) {
      case BreathingStep.startFresh:
        return const Color(0xffB47E37);
      case BreathingStep.sleep:
        return Colors.white;
      default:
        return const Color(0xff1B3C53);
    }
  }

  Color get buttonColor {
    switch (step) {
      case BreathingStep.sleep:
        return const Color(0xffDDD1C9);
      case BreathingStep.startFresh:
        return const Color(0xffFBAE47);
      default:
        return const Color(0xff1B3C53);
    }
  }

  Color get buttonTextColor =>
      step == BreathingStep.sleep ? const Color(0xff1B3C53) : Colors.white;

  // ================= CONTENT =================

  String get title {
    switch (step) {
      case BreathingStep.sleep:
        return "Sleep better";
      case BreathingStep.startFresh:
        return "Start fresh";
      default:
        return "Relax & unwind";
    }
  }

  String get description {
    switch (step) {
      case BreathingStep.sleep:
        return "This deep relaxing breathing exercise helps you get calm "
            "and fall asleep within minutes.\n"
            "Take 1 min 54 sec";
      case BreathingStep.startFresh:
        return "This breathing exercise gets you ready for the day "
            "feeling refreshed and relaxed.\n"
            "Take 54 sec";
      default:
        return "Improve your performance and connection with the "
            "breathing exercise, you’ll end up feeling relaxed "
            "and more focused.\n"
            "Take 1 min 36 sec for practice";
    }
  }

  // ================= NAV =================

  void onContinue() {
    setState(() {
      if (step == BreathingStep.relax) {
        step = BreathingStep.sleep;
      } else if (step == BreathingStep.sleep) {
        step = BreathingStep.startFresh;
      } else {
        Navigator.pop(context);
      }
    });
  }

  void onBack() {
    setState(() {
      if (step == BreathingStep.startFresh) {
        step = BreathingStep.sleep;
      } else if (step == BreathingStep.sleep) {
        step = BreathingStep.relax;
      } else {
        Navigator.pop(context);
      }
    });
  }

  // ================= UI =================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: onBack,
        ),
      ),

      body: Stack(
        children: [
          /// Mountains (أوضح + أجمل)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 290,
              child: CustomPaint(
                painter: MountainPainter(step),
              ),
            ),
          ),

          /// Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _topShape(),

                const SizedBox(height: 48),

                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    height: 1.4,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 60),

                SizedBox(
                  width: 260,
                  height: 54,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      foregroundColor: buttonTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: onContinue,
                    child: Text(
                      step == BreathingStep.startFresh
                          ? "Back to Exercises"
                          : "Continue",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= SHAPES =================

  Widget _topShape() {
    switch (step) {
      case BreathingStep.sleep:
        return const Icon(Icons.nightlight_round,
            size: 130, color: Colors.white);

      case BreathingStep.startFresh:
        return Container(
          width: 140,
          height: 70,
          decoration: const BoxDecoration(
            color: Color(0xffEA980A),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(140),
            ),
          ),
        );

      default:
        return Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        );
    }
  }
}

// ================= MOUNTAINS =================

class MountainPainter extends CustomPainter {
  final BreathingStep step;

  MountainPainter(this.step);

  @override
  void paint(Canvas canvas, Size size) {
    Paint back = Paint();
    Paint mid = Paint();
    Paint front = Paint();

    if (step == BreathingStep.relax) {
      back.color = const Color(0xffD2C1B6);
      mid.color = const Color(0xffC5B1A6);
      front.color = const Color(0xff817979);
    } else if (step == BreathingStep.sleep) {
      back.color = const Color(0xff162732);
      mid.color = const Color(0xff10222E);
      front.color = const Color(0xff0E1C25);
    } else {
      back.color = const Color(0xffB47E37);
      mid.color = const Color(0xffC8882A);
      front.color = const Color(0xffB96F0C);
    }

    Path p1 = Path()
      ..moveTo(0, size.height * .45)
      ..quadraticBezierTo(
          size.width * .25, size.height * .2, size.width * .55, size.height * .45)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    Path p2 = Path()
      ..moveTo(0, size.height * .6)
      ..quadraticBezierTo(
          size.width * .35, size.height * .35, size.width, size.height * .6)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    Path p3 = Path()
      ..moveTo(0, size.height * .72)
      ..quadraticBezierTo(
          size.width * .4, size.height * .55, size.width, size.height * .72)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(p1, back);
    canvas.drawPath(p2, mid);
    canvas.drawPath(p3, front);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
*/














import 'package:flutter/material.dart';

enum BreathingStep {
  relax,
  sleep,
  startFresh,
}

class MindfulBreathingScreen extends StatefulWidget {
  const MindfulBreathingScreen({super.key});

  @override
  State<MindfulBreathingScreen> createState() =>
      _MindfulBreathingScreenState();
}

class _MindfulBreathingScreenState extends State<MindfulBreathingScreen> {
  BreathingStep step = BreathingStep.relax;

  // ================= COLORS =================

  Color get backgroundColor {
    switch (step) {
      case BreathingStep.sleep:
        return const Color(0xff1B3C53);
      case BreathingStep.startFresh:
        return const Color(0xffFBAE47);
      default:
        return const Color(0xffDDD1C9);
    }
  }

  Color get textColor {
    switch (step) {
      case BreathingStep.startFresh:
        return const Color(0xffB47E37);
      case BreathingStep.sleep:
        return Colors.white;
      default:
        return const Color(0xff1B3C53);
    }
  }

  Color get buttonColor {
    switch (step) {
      case BreathingStep.sleep:
        return const Color(0xffDDD1C9);
      case BreathingStep.startFresh:
        return const Color(0xffFBAE47);
      default:
        return const Color(0xff1B3C53);
    }
  }

  Color get buttonTextColor =>
      step == BreathingStep.sleep ? const Color(0xff1B3C53) : Colors.white;

  // ================= CONTENT =================

  String get title {
    switch (step) {
      case BreathingStep.sleep:
        return "Sleep better";
      case BreathingStep.startFresh:
        return "Start fresh";
      default:
        return "Relax & unwind";
    }
  }

  String get description {
    switch (step) {
      case BreathingStep.sleep:
        return "This deep relaxing breathing exercise helps you get calm "
            "and fall asleep within minutes.\n"
            "Take 1 min 54 sec";
      case BreathingStep.startFresh:
        return "This breathing exercise gets you ready for the day "
            "feeling refreshed and relaxed.\n"
            "Take 54 sec";
      default:
        return "Improve your performance and connection with the "
            "breathing exercise, you’ll end up feeling relaxed "
            "and more focused.\n"
            "Take 1 min 36 sec for practice";
    }
  }

  // ================= NAV =================

  void onContinue() {
    setState(() {
      if (step == BreathingStep.relax) {
        step = BreathingStep.sleep;
      } else if (step == BreathingStep.sleep) {
        step = BreathingStep.startFresh;
      } else {
        Navigator.pop(context);
      }
    });
  }

  void onBack() {
    setState(() {
      if (step == BreathingStep.startFresh) {
        step = BreathingStep.sleep;
      } else if (step == BreathingStep.sleep) {
        step = BreathingStep.relax;
      } else {
        Navigator.pop(context);
      }
    });
  }

  // ================= UI =================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: onBack,
        ),
      ),

      body: Stack(
        children: [
          /// Mountains background
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 300,
              child: CustomPaint(
                painter: MountainPainter(step),
              ),
            ),
          ),

          /// Main content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _topShape(),

                const SizedBox(height: 48),

                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    height: 1.4,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 360), //  مكان الشمس والكلام
              ],
            ),
          ),

          /// Button ON mountains
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 280,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: buttonTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: onContinue,
                  child: Text(
                    step == BreathingStep.startFresh
                        ? "Back to Exercises"
                        : "Continue",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= SHAPES =================

  Widget _topShape() {
    switch (step) {
      case BreathingStep.sleep:
        return const Icon(
          Icons.nightlight_round,
          size: 130,
          color: Colors.white,
        );

      case BreathingStep.startFresh:
        return Container(
          width: 140,
          height: 70,
          decoration: const BoxDecoration(
            color: Color(0xffEA980A),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(140),
            ),
          ),
        );

      default:
        return Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        );
    }
  }
}

// ================= MOUNTAINS =================

class MountainPainter extends CustomPainter {
  final BreathingStep step;

  MountainPainter(this.step);

  @override
  void paint(Canvas canvas, Size size) {
    Paint back = Paint();
    Paint front = Paint();

    if (step == BreathingStep.relax) {
      back.color = const Color(0xffD2C1B6);
      front.color = const Color(0xff817979);
    } else if (step == BreathingStep.sleep) {
      back.color = const Color(0xff162732);
      front.color = const Color(0xff0E1C25);
    } else {
      back.color = const Color(0xffB47E37);
      front.color = const Color(0xffB96F0C);
    }

    Path backMountain = Path()
      ..moveTo(0, size.height * 0.45)
      ..quadraticBezierTo(
        size.width * 0.3,
        size.height * 0.15,
        size.width * 0.6,
        size.height * 0.45,
      )
      ..quadraticBezierTo(
        size.width * 0.8,
        size.height * 0.65,
        size.width,
        size.height * 0.45,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    Path frontMountain = Path()
      ..moveTo(0, size.height * 0.65)
      ..quadraticBezierTo(
        size.width * 0.35,
        size.height * 0.45,
        size.width * 0.7,
        size.height * 0.65,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(backMountain, back);
    canvas.drawPath(frontMountain, front);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


















