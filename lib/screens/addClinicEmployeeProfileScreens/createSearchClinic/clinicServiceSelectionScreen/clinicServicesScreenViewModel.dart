import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.router.dart';
import '../../../../services/services/local_storage.dart';
import '../../../../services/services/api_service.dart';
import '../../../../model/clinic.dart';

class ClinicServiceSelectionViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final DialogService _dialogService = locator<DialogService>();
  final APIServices _aPIServices = locator<APIServices>();
  // __________________________________________________________________________
  // Controller and Variables
  List<String> selected = [];
  List<String> serviceList = [
    'Blood Test',
    'X-Ray',
    'MRI',
    "ECG",
    "Sonography"
  ];

  TextEditingController clinicOwnerName = TextEditingController();
  TextEditingController clinicPhoneNumber = TextEditingController();
  final clinicDesciptionFormKey = GlobalKey<FormState>();
  // __________________________________________________________________________
  // Helper Function

  // Add the service is not present is selectedService list else remove it
  void addService(String service) {
    if (selected.contains(service))
      selected.remove(service);
    else
      selected.add(service);

    notifyListeners();
  }

  void saveClinicServiceToLocal() async {
    await _storageService.setClinicService(selected);
    showConfirmationDialogForCreatingClinic();
  }

  void showConfirmationDialogForCreatingClinic() async {
    var response = await _dialogService.showConfirmationDialog(
        title: "Do you want to continue ?",
        description:
            "This will create a new clinic and by clicking on continue, you are agreeing to our terms of use & privacy policy",
        cancelTitle: "Cancel",
        confirmationTitle: "Continue",
        dialogPlatform: DialogPlatform.Custom);

    if (response.confirmed) {
      setBusy(true);
      await createClinic();
      setBusy(false);
    }
  }

  Future createClinic() async {
    Clinic clinic = await _aPIServices.createClinic();
    if (clinic != null)
      navigateToWelcomeScreen();
    else
      _snackBarService.showSnackbar(
          message: "We couldn't complete the request. Try again later.");
  }

  // ___________________________________________________________________________
  void navigateToWelcomeScreen() {
    _navigatorService.pushNamedAndRemoveUntil(Routes.root,
        predicate: (route) => false);
  }
  // ___________________________________________________________________________
}
