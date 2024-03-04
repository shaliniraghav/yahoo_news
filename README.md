# yahoo_news

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Yahoo News Application
The Yahoo News Application is a mobile app built with Flutter that provides users with access to the latest news articles from various sources. It fetches news data from the Yahoo Finance API and presents it in a user-friendly interface.

Features
Browse News Articles: Users can scroll through a list of news articles fetched from the Yahoo Finance API.

View Article Details: Tapping on an article displays additional details such as title, source, and publication date.

Read Full Article: Users can read the full article by tapping on it, which opens the source article in the device's web browser.

Smooth UI Experience: The application offers a smooth and responsive user interface for a seamless browsing experience.

Technologies Used
Flutter SDK: Flutter is a UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
Dart Programming Language: Dart is the programming language used for building Flutter applications.
HTTP Package: The HTTP package is used to make API requests to fetch news articles from the Yahoo Finance API.
url_launcher Package: The url_launcher package is used to open URLs in the web browser when the user taps on an article.

Installation Guide
To run the application locally, follow these steps:

Clone the Repository: Clone the repository to your local machine using the following command:

bash

git clone https://github.com/your-username/yahoo_news.git
Navigate to the Project Directory: Use the following command to navigate into the project directory:

bash

cd yahoo_news
Install Dependencies: Use Flutter's package manager, pub, to install the project dependencies:

arduino

flutter pub get
Run the Application: Run the application on a connected device or emulator using the following command:

arduino

flutter run

Usage
Browse Articles: Scroll through the list of articles to browse the latest news.

View Details: Tap on an article to view additional details such as title, source, and publication date.

Read Full Article: Tap on an article to open the source article in the web browser and read the full content.


Folder Structure
The project's folder structure is as follows:
yahoo_news/
|-- lib/
|   |-- main.dart
|   |-- article_page.dart
|   |-- models/
|       |-- article.dart
|-- pubspec.yaml
lib/: Contains the Dart files for the application logic and user interface.
main.dart: Entry point of the application.
article_page.dart: Widget for displaying the list of articles.
models/: Directory for storing data models.
article.dart: Data model for representing news articles.


Contributing
Contributions to the Yahoo News Application are welcome! If you'd like to contribute, feel free to fork the repository, make improvements, and submit pull requests. Please adhere to the existing code style and conventions.


Thank you so much.
