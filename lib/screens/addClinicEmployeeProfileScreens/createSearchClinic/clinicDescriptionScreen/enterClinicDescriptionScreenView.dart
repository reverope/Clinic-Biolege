import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import '../../../../main.dart';
import '../../../../widgets/reusables.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/animations.dart';
import 'enterClinicDescriptionScreenViewModel.dart';

class AddClinicDescriptionScreenView extends StatelessWidget {
  static const routeName = "/addClinicDescriptionScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddClinicDescriptionViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBar(context),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Container(
                height: SizeConfig.screenHeight * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FadeInLTR(
                          0.3,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                mainLogo,
                                height: getProportionateScreenHeight(25),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    FadeInLTR(
                      0.6,
                      Text(
                        "Clinic address",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Form(
                        key: model.clinicDesciptionFormKey,
                        child: Column(
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
                                maxLength: 30,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                keyboardType: TextInputType.text,
                                decoration: buildInputDecoration(
                                    "Statename",
                                    Icon(
                                      MaterialCommunityIcons.account,
                                      color: primaryColor,
                                    )),
                                controller: model.clinicStateName,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            FadeInLTR(
                              1.2,
                              Text(
                                "City",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            FadeInLTR(
                              1.2,
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                maxLength: 30,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                keyboardType: TextInputType.text,
                                decoration: buildInputDecoration(
                                    "Cityname",
                                    Icon(
                                      MaterialCommunityIcons.account,
                                      color: primaryColor,
                                    )),
                                controller: model.clinicCityName,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            FadeInLTR(
                              1.5,
                              Text(
                                "Clinic Address",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            FadeInLTR(
                              1.5,
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                maxLength: 50,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                keyboardType: TextInputType.streetAddress,
                                decoration: buildInputDecoration(
                                    "Clinic Address",
                                    Icon(
                                      MaterialCommunityIcons.map,
                                      color: primaryColor,
                                    )),
                                controller: model.clinicAddress,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            FadeInLTR(
                              1.8,
                              Text(
                                "Clinic address proof  ( Trade License ) ",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            FadeInLTR(
                              1.8,
                              buildBasicOutlineButton(
                                  Text(
                                    "Upload Photo",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300),
                                  ),
                                  () {}),
                            ),
                          ],
                        )),
                    Spacer(),
                    FadeInLTR(
                      1.8,
                      buildOutlineButton(
                        "Continue",
                        model.navigateToClinicOwnerDetails,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
        );
      },
      viewModelBuilder: () => AddClinicDescriptionViewModel(),
    );
  }
}
