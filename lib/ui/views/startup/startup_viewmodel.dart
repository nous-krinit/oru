import 'package:stacked/stacked.dart';
import 'package:oru_phones/app/app.locator.dart';
import 'package:oru_phones/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/api_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    try {
      // Call API to check login status
      final data = await _apiService.getStatus();
      bool isLoggedIn = data['isLoggedIn'];
      String userName = data['userName'];

      if (isLoggedIn) {
        // Navigate to Home if user is logged in
        _navigationService.replaceWithHomeView();
      } else {
        // Navigate to Login if user is not logged in
        _navigationService.replaceWithHomeView();
      }
    } catch (e) {
      // Handle errors (e.g., API failure) and navigate to Login
      _navigationService.replaceWithHomeView();
    }
    _navigationService.replaceWithHomeView();
  }
}
