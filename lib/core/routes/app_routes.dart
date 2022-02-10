part of 'app_pages.dart';

enum Routes {
  launch,
}

///
extension RoutesExtension on Routes {
  String get name {
    switch (this) {
      case Routes.launch:
      default:
        return '/';

      /// Add more routes
    }
  }
}
