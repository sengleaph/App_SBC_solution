import 'package:local_auth/local_auth.dart';

class Authenticated {
  Future<void> authenticated() async {
    final localAuth = LocalAuthentication();

    try {
      bool didAuthenticated = await localAuth.authenticate(
        localizedReason:
            'Please authenticate to access the app', // Reason for authentication request
      );

      if (didAuthenticated) {
        // Authentication successful, grant access
        print('Authentication successful');
        // You can navigate to your app's main screen or perform any other actions here.
      } else {
        // Authentication failed or canceled
        print('Authentication failed');
      }
    } catch (e) {
      // Handle any exceptions or errors here
      print('Error: $e');
    }
  }
}
