# Twitart

Twitart is an social application like Twitter using Firebase.

## Download
- [Android](https://drive.google.com/file/d/1ROCrAlMdntkrmOWYPHB_p1nmgPftDDsQ/view?usp=sharing "Android")

## Features

 - Realtime feed (✅ Android, ✅ iOS)
 - Edit Tweet (✅ Android, ✅ iOS)
 - Delete Tweet (✅ Android, ✅ iOS)
 - Google Sign In (✅ Android, ✅ iOS)
 - Like Tweet (Coming soon)
 - Retweet Tweet (Coming soon)
 - Comment Tweet (Coming soon)
 - Profile Section (Coming soon)

## Library & Tool Used

 - [auto_route](https://pub.dev/packages/auto_route): ^4.2.0
 - [flutter_bloc](https://pub.dev/packages/flutter_bloc): ^8.0.1
 - [equatable](https://pub.dev/packages/equatable): ^2.0.3
 - [ionicons](https://pub.dev/packages/ionicons): ^0.1.2
 - [lottie](https://pub.dev/packages/lottie): ^1.3.0
 - [flutter_screenutil](https://pub.dev/packages/flutter_screenutil): ^5.5.3+2
 - [firebase_auth](https://pub.dev/packages/firebase_auth): ^3.4.1
 - [firebase_core](https://pub.dev/packages/firebase_core): ^1.19.1
 - [google_sign_in](https://pub.dev/packages/google_sign_in): ^5.4.0
 - [flutter_facebook_auth](https://pub.dev/packages/flutter_facebook_auth): '^3.5.0'
 - [flutter_native_splash](https://pub.dev/packages/flutter_native_splash): ^2.2.4
 - [shared_preferences](https://pub.dev/packages/shared_preferences): ^2.0.15
 - [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage): ^5.0.2
 - [cloud_firestore](https://pub.dev/packages/cloud_firestore): ^3.2.1
 - [intl](https://pub.dev/packages/intl): ^0.17.0
 - [timeago](https://pub.dev/packages/timeago): ^3.2.2
 - [google_sign_in_mocks](https://pub.dev/packages/google_sign_in_mocks): ^0.2.1
 - [auto_route_generator](https://pub.dev/packages/auto_route_generator "auto_route_generator"):
 - [build_runner](https://pub.dev/packages/build_runner "build_runner"):
 
## Recruitment
- Flutter version ^3.0
- Dart version 2.17.5
- Android SDK
- Emulator/Real Device Android/iOS

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/yusufhnf/twitart-app.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## How to Run

 - If you want using *hot reload* feature, run this command:

    `flutter run --debug`

 - If you want in stable, run this command:

    `flutter run --release`

 - If you want running with profilling to check the performance, run this command:

    `flutter run --profile`

## Development Process
### State Management
For state management, developer using BLoC with cubit.

[![BLoC Cubit](https://i0.wp.com/resocoder.com/wp-content/uploads/2020/07/cubit_architecture_full.png?w=800&ssl=1 "BLoC Cubit")](https://resocoder.com/2020/08/04/flutter-bloc-cubit-tutorial "BLoC Cubit")

### Routing
- For routing, developer using auto_route with generator. So every adding page, developer must insert route initial in every page like this:
```dart
class DashboardScreen extends StatelessWidget {
      const DashboardScreen({Key? key}) : super(key: key);
    //insert adactive route
      static const route =
          AdaptiveRoute(path: '/dashboard-screen', page: DashboardScreen);
    }
```
- After that, developer must register the page to lib/src/navigation/routes.dart. For the example:
```dart
@AdaptiveAutoRouter(routes: <AutoRoute>[
  LoginScreen.route,
  DashboardScreen.route, // add this
  AddTweetScreen.route
])
class $AppRouter {}
```
- Every register the route, developer must execute this command to regenerate the routes:
```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Firebase Integration
For firebase integration, developer using **Flutter direct integration**. So developer can integrating Firebase to Flutter project with automatically in all platform using flutterfire-cli. For installation and integration, you can read this [documentation](https://firebase.google.com/docs/flutter/setup?platform=android "documentation").

## About me
With more than 4 years of experience in mobile application development, I hope to make unique and different breakthroughs in solving problems through technology. Through mobile applications, I hope to become a world-class developer that is useful for life.  

 - [Check resume and portfolio](https://linktr.ee/meetucup)
 - [LinkedIn](https://www.linkedin.com/in/yusufhnf/) 
 - [Mywebsite](yusufhnf.github.io)

 