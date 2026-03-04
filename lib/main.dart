/*import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamenny/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:tamenny/features/recommendations/presentation/screens/books_screen.dart';
import 'package:tamenny/features/chat/presentation/screens/chat_screen.dart';
import 'package:tamenny/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:tamenny/features/authentication/presentation/screens/login_screen.dart';
import 'package:tamenny/features/authentication/presentation/screens/forget_password.dart';
import 'package:tamenny/features/authentication/data/register_view_model.dart';
import 'package:tamenny/features/splash/splash_screen.dart';
import 'package:tamenny/features/authentication/presentation/screens/landing_page.dart';
import 'package:tamenny/features/home/presentation/screens/home_screen.dart';

// ===== Dummy Screens =====


class TrackerScreen extends StatelessWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text("Tracker Screen")),
      );
}

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text("Booking Screen")),
      );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text("Profile Screen")),
      );
}

// ===== Main =====
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ===== Routes =====
      routes: {
        '/splash': (_) => SplashScreen(),
        '/landing': (_) => const AuthLandingPage(),
        '/forget_password': (_) => const ForgetPasswordScreen(),
        '/signup': (_) => const CreateAccountScreen(),
        '/login': (_) => const LoginScreen(),
        '/home': (_) => const HomeScreen(),
        '/tracker': (_) => const TrackerScreen(),
        '/chat': (_) => const ChatScreen(),
        '/booking': (_) => const BookingScreen(),
        '/profile': (_) => const ProfileScreen(),
        '/recommendations': (_) => const BooksScreen(),
        '/onboarding': (_) => const OnboardingScreen(),
      },

      home:HomeScreen() ,
    );
  }
}


 */




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ===== Core =====
import 'package:tamenny/features/splash/splash_screen.dart';
import 'package:tamenny/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:tamenny/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:tamenny/features/authentication/data/register_view_model.dart';
import 'package:tamenny/features/authentication/presentation/screens/landing_page.dart';
import 'package:tamenny/features/authentication/presentation/screens/login_screen.dart';
import 'package:tamenny/features/authentication/presentation/screens/select_role_screen.dart';

// ===== Home =====
import 'package:tamenny/features/home/presentation/screens/home_screen.dart';
import 'package:tamenny/features/mood_tracker/presentation/screens/mood_tracker_screen.dart';
import 'package:tamenny/features/mood_tracker/presentation/screens/setـmoodـscreen.dart';
import 'package:tamenny/features/recommendations/presentation/screens/exercise_screens/exercise.dart';

// ===== Chat =====
import 'package:tamenny/features/chat/presentation/screens/chat_screen.dart';

// ===== Recommendations =====
import 'package:tamenny/features/recommendations/presentation/screens/books_screen.dart';
import 'package:tamenny/features/recommendations/presentation/screens/podcasts_screen.dart';
import 'package:tamenny/features/recommendations/presentation/screens/mbti_test_screen.dart';
import 'package:tamenny/features/recommendations/presentation/screens/exercise_screens/mindful_breathing.dart';
import 'package:tamenny/features/recommendations/presentation/screens/exercise_screens/meditation.dart';
import 'package:tamenny/features/recommendations/presentation/screens/exercise_screens/journaling.dart';

// ===== Profile =====
import 'package:tamenny/features/profile/presentation/screens/profile_screen.dart';
import 'package:tamenny/features/profile/presentation/screens/myProfile.dart';
import 'package:tamenny/features/profile/presentation/screens/edit-name.dart';
import 'package:tamenny/features/profile/presentation/screens/edit-mail.dart';
import 'package:tamenny/features/profile/presentation/screens/edit-password.dart';
import 'package:tamenny/features/profile/presentation/screens/notofication.dart';
import 'package:tamenny/features/profile/presentation/screens/language.dart';
import 'package:tamenny/features/profile/presentation/screens/favourite.dart';
import 'package:tamenny/features/profile/presentation/screens/emergency.dart';
import 'package:tamenny/features/profile/presentation/screens/specialist-set-available.dart';


// ===== Dummy / Future Screens =====
import 'package:tamenny/features/booking/presentation/screens/booking_screen.dart';
//import 'package:tamenny/features/mood/presentation/screens/mood_tracker_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// ===== Routes =====
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/onboarding': (_) => const OnboardingScreen(),
        '/landing': (_) => const AuthLandingPage(),
        '/signup': (_) => const CreateAccountScreen(),
        '/login': (_) => const LoginScreen(),
        '/role': (_) => const SelectRoleScreen(),

        '/home': (_) => const HomeScreen(),

        // Home actions
        '/chat': (_) => const ChatScreen(),
        '/booking': (_) => const BookingScreen(),
         '/mood': (_) => const MoodTrackerScreen(),
        '/setmood': (_) => const SetMoodScreen(),

        // Recommendations
        '/books': (_) => const BooksScreen(),
        '/podcasts': (_) => const PodcastsScreen(),
        '/mbti': (_) => const MbtiLandingPage(),
        '/exercises': (_) => const ExercisesScreen(),
        '/exercises_mindful': (_) => const  MindfulBreathingScreen(),
        '/exercises_meditation': (_) => const   MeditationScreen(),
        '/exercises_journaling': (_) => const JournalingScreen  (),

        // Profile
        '/profile': (_) => const ProfileScreen(),
        '/myProfile': (_) => const MyProfileScreen(),
        '/editName': (_) => const EditNameScreen(),
        '/editEmail': (_) => const EditMailScreen(),
        '/editPassword': (_) => const EditPasswordScreen(),
        '/notifications': (_) => const NotificationScreen(),
        '/language': (_) => const LanguageScreen(),
        '/favourite': (_) => const FavouriteScreen(),
        '/emergency': (_) => const EmergencyScreen(),
        '/setAvailable': (_) => const SpecialistProfileScreen(),
      },

      home: const SplashScreen() ,
    );
  }
}

