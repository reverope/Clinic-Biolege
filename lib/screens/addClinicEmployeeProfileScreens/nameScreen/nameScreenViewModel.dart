import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../services/services/local_storage.dart';
import '../../../app/locator.dart';
import '../../../app/router.router.dart';
// import '../../../services/services/auth_service.dart';

class NameViewModel extends BaseViewModel {
  // _________________________________________________________________________
  // Locating the Dependencies

  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();
  // _________________________________________________________________________
  // Controllers

  TextEditingController name = TextEditingController();
  final nameFormKey = GlobalKey<FormState>();

  // _________________________________________________________________________
  //Validating entered Name

  String validateName(String value) {
    return value.isEmpty
        ? "Name cannot be empty"
        : value.length > 2
            ? null
            : "Name should be atleast 3 characters long";
  }

  // _________________________________________________________________________
  // Saving Name
  void saveName() async {
    nameFormKey.currentState.save();
    if (!nameFormKey.currentState.validate()) return;

    await _storageService
        .setName(name.text)
        .whenComplete(() => navigateToEmailScreenView());
  }

  void navigateToEmailScreenView() {
    _navigatorService.navigateTo(Routes.emailScreenView);
  }
  // _________________________________________________________________________
}
