# Vartur Flutter App

This is a Flutter mobile application named **Vartur**, featuring a native splash screen, bottom navigation, API image fetching, and screen navigation.

---

## 🚀 How to Run the Project

1. **Clone the repository**

   ```bash
   git clone https://github.com/omar11698/vartur.git
   cd vartur
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

---

## 🛠️ Features & How It Was Built

- **Initial Setup**:

  - Created the main screen called `VarturScreen` with a `BottomNavigationBar`.

- **Bottom Navigation Tabs**:

  - `Vartur`: Fetches and displays image data from an API in a scrollable list.
  - `Search`: Functional or placeholder screen for searching.
  - `My Account`: Displays user information or profile section.

- **API Integration**:

  - The Vartur screen fetches images from an external API.
  - Each image is shown using a `ListTile`, with title and thumbnail.

- **Native Splash Screen**:

  - Implemented using the `flutter_native_splash` package.
  - Fully supports Android 12 with foreground image setup and branding.

- **Asset and Constants Setup**:

  - All app assets are stored inside an `assets/` directory.
  - A constants folder is generated to manage asset paths and reuse them easily.

- **Screens**:

  - **Image View Screen**: When the user taps on a thumbnail image, they are navigated to a screen that displays the image along with its title and description.
  - **My Account Screen**: Structured layout for showing basic account or profile details.

- **Models**:
  - A `ResponseModel` class is created to parse and structure the image data returned from the API.

---

## 📁 Folder Structure

```
lib/
├── main.dart
├── screens/
│   ├── vartur_screen.dart
│   ├── search_screen.dart
│   ├── my_account_screen.dart
│   └── image_view_screen.dart
├── data/
│   └── response_model.dart
│   └── api.dart
├── constants/
│   └── assets.dart
```

---

## 📸 Demo

_(Add screenshots or screen recordings here if needed)_
![alt text](screenshot-2025-04-24_11.58.49.666.png)

Made with ❤️ using Flutter
