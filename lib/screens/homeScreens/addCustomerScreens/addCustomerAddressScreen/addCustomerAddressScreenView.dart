import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'addCustomerAddressScreenViewModel.dart';
import '../../../../widgets/reusables.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/animations.dart';

class AddCustomerAddressScreenView extends StatelessWidget {
  static const routeName = "/addCustomerAddressScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddCustomerAddressScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBar(context),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    FadeInLTR(
                      0.6,
                      Text(
                        "Address Details",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Form(
                        key: model.addressFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInLTR(
                              0.9,
                              Text(
                                "State",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            FadeInLTR(
                              0.9,
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                maxLength: 40,
                                validator: (value) =>
                                    model.validateState(value),
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                keyboardType: TextInputType.text,
                                decoration: buildInputDecoration(
                                    "State",
                                    Icon(
                                      Feather.map,
                                      color: primaryColor,
                                    )),
                                controller: model.state,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.2,
                              Text(
                                "City",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.2,
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                maxLength: 40,
                                validator: (value) => model.validateCity(value),
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                keyboardType: TextInputType.text,
                                decoration: buildInputDecoration(
                                    "City Name",
                                    Icon(
                                      MaterialCommunityIcons.city,
                                      color: primaryColor,
                                    )),
                                controller: model.city,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.5,
                              Text(
                                "Pincode",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.5,
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                maxLength: 6,
                                validator: (value) =>
                                    model.validatePincode(value),
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                keyboardType: TextInputType.number,
                                decoration: buildInputDecoration(
                                    "Pincode",
                                    Icon(
                                      Feather.map_pin,
                                      color: primaryColor,
                                    )),
                                controller: model.pinCode,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.8,
                              Text(
                                "Home Address",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            FadeInLTR(
                              1.8,
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                maxLength: 150,
                                validator: (value) =>
                                    model.validateHomeAddress(value),
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                keyboardType: TextInputType.text,
                                decoration: buildInputDecoration(
                                    "Home Address",
                                    Icon(
                                      MaterialCommunityIcons.home_city,
                                      color: primaryColor,
                                    )),
                                controller: model.homeAddress,
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: getProportionateScreenHeight(50),
                    ),
                    FadeInLTR(
                      2.1,
                      !model.isBusy
                          ? buildOutlineButton(
                              "Continue",
                              model.saveAddressDetails,
                            )
                          : buildOutlineButtonCustomWidget(
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        getProportionateScreenHeight(20),
                                    vertical: 2),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("        "),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(
                                        backgroundColor: white,
                                      ),
                                    ),
                                    Text("        "),
                                    SizedBox(
                                      width: getProportionateScreenWidth(10),
                                    ),
                                  ],
                                ),
                              ),
                              null),
                    )
                  ],
                ),
              ),
            ),
          )),
        );
      },
      viewModelBuilder: () => AddCustomerAddressScreenViewModel(),
    );
  }
}
