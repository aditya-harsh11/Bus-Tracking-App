# Bus Tracking App

A Flutter-based mobile application that allows parents, students, and teachers to track school bus locations in real-time.

## Overview

An application to allow parents, students and teachers to track the school bus location.

- Use a cloud-based system to track school buses using GPS data from bus teacher's mobile app
- Developed the system with the Flutter framework using DART and stored data in Google Firebase
- Collaborated with Mallya Aditi International School to try and implement the application

## Features

- **Real-time Bus Tracking**: Track school buses using GPS data from teachers' mobile devices
- **Multi-User Support**: Separate interfaces for Teachers, Students, and Parents
- **Route Management**: Support for multiple bus routes (currently 14 routes)
- **Firebase Integration**: Cloud-based data storage and real-time synchronization
- **Google Maps Integration**: Interactive map display for bus location visualization
- **Teacher Authentication**: Secure login system for bus teachers

## Technology Stack

- **Framework**: Flutter
- **Language**: Dart
- **Backend**: Google Firebase (Firestore, Authentication, Realtime Database)
- **Maps**: Google Maps Flutter
- **Location Services**: GPS tracking via Location plugin
- **Cloud Infrastructure**: Google Cloud Platform (via Firebase)

## Getting Started

### Prerequisites

- Flutter SDK (>=2.17.1 <3.0.0)
- Dart SDK
- Firebase project setup
- Google Maps API key
- Android Studio / Xcode (for mobile development)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/Bus-Tracking-App.git
cd Bus-Tracking-App
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:
   - Add your `google-services.json` file to `android/app/`
   - Configure Firebase for iOS if needed
   - Set up Firebase Authentication and Firestore

4. Add Google Maps API Key:
   - Configure your API key in the Android and iOS configuration files

5. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── components/          # Reusable components
├── StudentView/        # Student interface screens
├── TeacherLocationSharing/  # Teacher location sharing screens
├── OrderTrackingPage/  # Order tracking pages
├── landingPage.dart    # Landing page
├── main.dart          # App entry point
└── ...
```

## Contributors

- Aditya Harshavardhan
- Saket Kanagal



