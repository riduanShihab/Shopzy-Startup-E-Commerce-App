# Shopzy App

A premium, state-managed e-commerce mobile application built with Flutter.

## 📱 Project Overview
Shopzy is designed to provide a seamless shopping experience with a modern, glassmorphic, dark-mode design that matches the original web prototypes. 

## 🛠️ Tech Stack & Tools Used
- **Flutter Framework:** The core cross-platform framework.
- **Supabase:** Used as the backend-as-a-service (BaaS) for dynamic data storage (product catalog, user carts) and user authentication.
- **GetX:** The primary state management and routing architecture, providing an efficient way to handle navigation flows without standard Flutter context limitations.
- **Provider:** Included for additional or legacy state management needs.
- **Styling:** Utilizes Material 3 design principles, enhanced with `google_fonts` for typography and custom theming (located in the `lib/theme/` folder) to achieve the signature dark-mode aesthetic.

## 📁 Project Structure & Screens
The core logic is organized inside the `lib/` directory:

- **`main.dart` & `main_layout.dart`:** The entry points that initialize the app, set up GetX/Supabase, and provide the base layout structure.
- **`screens/` Folder:** Contains the primary user interfaces:
  - `splash_screen.dart`: The initial loading screen.
  - `login_signup_screen.dart`: Supabase user authentication.
  - `home_feed_screen.dart`: The main dashboard for product discovery.
  - `product_details_screen.dart`: Deep-dive view for individual products.
  - `your_cart_screen.dart`: Cart management.
  - `checkout_screen.dart`: Final purchase processing.
- **`models/` Folder:** Structural blueprints (classes) for data (e.g., Product, User).
- **`providers/` Folder:** Business logic and state managers.

## ✨ Advanced Features
- **Profile Functionality:** Persistent data saving and user profile editing.
- **AI & Vision Features:** Exploration and integration for an AI shopping assistant (Gemini) and image-based search (Google Cloud Vision) for a cutting-edge experience.

## Getting Started

To run this project:
1. Ensure you have [Flutter](https://docs.flutter.dev/get-started/install) installed.
2. Clone the repository and run `flutter pub get`.
3. Configure your Supabase credentials.
4. Run the app using `flutter run`.
