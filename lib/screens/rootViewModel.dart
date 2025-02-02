import 'package:location/location.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/services/dataFromApiService.dart';
import '../services/services/local_storage.dart';
import '../app/locator.dart';
import '../app/router.router.dart';
import '../services/services/auth_service.dart';

class RootViewModel extends BaseViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final NavigationService _navigatorService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final StorageService _storageService = locator<StorageService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final SnackbarService _snackBarService = locator<SnackbarService>();

  // __________________________________________________________________________
  // Reroutes the user to either Emailscreenview or Onboarding Screen

  Future getCurrentLocation() async {
    // Check for services and permission
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    Location location = new Location();
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) return null;
    }
    _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) return null;
    }
    notifyListeners();
  }

  Future handleStartupLogic() async {
    try {
      await getCurrentLocation();
      // ---------------------------------------------------------------------
      // Check whether user has logged in or not
      var hasLoggedIn = await _authenticationService.isUserLoggedIn();
      // ---------------------------------------------------------------------
      // To be used when the user is filling up the detail and not yet created
      // clinic and user
      await _storageService.initLocalStorages();
      // Get all the clinics in the beginning itself
      DateTime start = DateTime.now();
      if (_dataFromApiService.getAllClinics == null)
        await _dataFromApiService.setClinicsList();
      // Get all the doctors in the beginning itself
      if (_dataFromApiService.getDoctorsList == null)
        await _dataFromApiService.setDoctorsList();
      // Get all the diagnotic customer in the beginning itself
      if (_dataFromApiService.getDiagnosticCustomerList == null)
        await _dataFromApiService.setDiagnosticCustomersList();
      DateTime end = DateTime.now();
      print(
          "*----------------------------------------------------------------*");
      print("Time to set/fetch Clinic/Doctor/DiagnosticCustomer: " +
          (end.difference(start)).inSeconds.toString() +
          " seconds");
      // ---------------------------------------------------------------------
      print(
          "*----------------------------------------------------------------*");
      print("Phone        : " + _storageService.getPhoneNumber.toString());
      print("Name         : " + _storageService.getName.toString());
      print("Email        : " + _storageService.getEmailAddress.toString());
      print("DOB          : " + _storageService.getDateOfBirth.toString());
      print("Address      : " + _storageService.getAddress.toString());
      print("Role Type    : " + _storageService.getRoleType.toString());
      print("Clinic Name  : " + _storageService.getClinicName.toString());
      print("Clinic City  : " + _storageService.getClinicCityName.toString());
      print("Clinic Owner  : " + _storageService.getClinicOwnerName.toString());
      print(
          "*----------------------------------------------------------------*");
      // ---------------------------------------------------------------------
      if (hasLoggedIn) {
        if (_storageService.getName == null)
          _navigatorService.clearStackAndShow(Routes.nameScreenView);
        else if (_storageService.getDateOfBirth == null)
          _navigatorService.clearTillFirstAndShow(Routes.genderScreenView);
        else if (_storageService.getAddress == null)
          _navigatorService.clearTillFirstAndShow(Routes.addressScreenView);
        else if (_storageService.getRoleType == null)
          _navigatorService.clearTillFirstAndShow(Routes.roleSelectScreenView);
        else if (_storageService.getClinicName == null ||
            _storageService.getClinicCityName == null ||
            _storageService.getClinicOwnerName == null)
          _navigatorService
              .clearStackAndShow(Routes.createOrSearchClinicScreenView);
        else {
          // ___________________________________________________________________
          DateTime start = DateTime.now();
          // Setter for all the clinic employee
          await _dataFromApiService.setEmployeeList();
          // Setter for all the doctors available in the clinic
          await _dataFromApiService.setDoctorsListForClinic();
          // Setter for clinic details
          await _dataFromApiService.setClinicDetails();
          // Setter for clinic employee details
          await _dataFromApiService.setEmployeeDetails();
          // ___________________________________________________________________
          DateTime end = DateTime.now();
          print(
              "*------------------------------------------------------------*");
          print(
              "Time to set/fetch Employee/DoctorsListForClinic/ClinicDetails/EmployeeDetails " +
                  (end.difference(start)).inSeconds.toString() +
                  " seconds");
          print(
              "*------------------------------------------------------------*");
          _navigatorService.pushNamedAndRemoveUntil(Routes.welcomeScreenView,
              predicate: (_) => false);
        }
      } else
        _navigatorService.pushNamedAndRemoveUntil(Routes.onBoardingScreen,
            predicate: (_) => false);
    } catch (e) {
      print("At Handle Startup Logic : " + e.toString());
      _snackBarService.showSnackbar(message: e.toString());
    }
  }
}
