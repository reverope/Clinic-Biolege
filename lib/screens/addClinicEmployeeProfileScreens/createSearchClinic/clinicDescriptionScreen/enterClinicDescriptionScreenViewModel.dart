import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';

class AddClinicDescriptionViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  final clinicDesciptionFormKey = GlobalKey<FormState>();
  TextEditingController clinicStateName = TextEditingController();
  TextEditingController clinicCityName = TextEditingController();
  TextEditingController clinicAddress = TextEditingController();
  TextEditingController clinicPincode = TextEditingController();

  // void navigateToWelcomeScreen() {
  //   _navigatorService.pushNamedAndRemoveUntil(Routes.welcomeScreenView,
  //       predicate:
  //           ModalRoute.withName(CreateOrSearchClinicScreenView.routeName));
  // }

  void navigateToClinicOwnerDetails() {
    _navigatorService.navigateTo(
      Routes.addClinicOwnerDetailsScreenView,
    );
  }
}
