import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.router.dart';
import '../../../../services/services/helperData_service.dart';

class AddPatientNameScreenViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final PatientDetails _patientDetailsService = locator<PatientDetails>();
  // __________________________________________________________________________
  // Controller and Variables
  final addCustomerNameFormKey = GlobalKey<FormState>();
  TextEditingController newCustomerName = TextEditingController();
  // __________________________________________________________________________
  // Validators

  String validateName(String cname) {
    return cname.isEmpty
        ? "Patient name cannot be empty"
        : cname.length > 2
            ? null
            : "Patient name should be atleast 3 characters long";
  }

  // __________________________________________________________________________
  // Helping Functions
  void navigateTocustomerDetails() {
    addCustomerNameFormKey.currentState.save();
    if (!addCustomerNameFormKey.currentState.validate()) return;
    _patientDetailsService.setDoctorsPatientName(newCustomerName.text);
    _navigatorService.navigateTo(Routes.addCustomerDetailsScreenView);
  }
  // __________________________________________________________________________
}
