# Airbnb Clone

This project is a SwiftUI-based Airbnb clone application that includes Firebase authentication, Firestore integration, and photo uploading capabilities. The app follows the MVVM architecture and makes use of the PhotosPicker component for selecting profile images. The app supports user sign-up, login, and logout functionalities, along with the ability to update the user’s profile photo during the sign-up process.

## Features

- User Authentication (Sign-up, Login, Logout) using Firebase.
- Firestore integration for storing and retrieving user data.
- Upload user profile photos to Firebase Storage.
- Display and select profile photos using the `PhotosPicker` component.
- MVVM architecture for clear separation of concerns.
- Asynchronous network requests using `async/await`.

## Technologies Used

- SwiftUI for building the user interface.
- Firebase Authentication for managing user accounts.
- Firebase Firestore for cloud database storage.
- Firebase Storage for photo uploads.
- MVVM architecture pattern.
- Swift concurrency with `async/await` for network requests.
- `PhotosPicker` for image selection.

## Prerequisites

- Xcode 14.0 or later.
- A valid Firebase project setup with Firestore and Firebase Authentication enabled.
- Firebase Storage for uploading profile photos.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/airbnb-clone.git
