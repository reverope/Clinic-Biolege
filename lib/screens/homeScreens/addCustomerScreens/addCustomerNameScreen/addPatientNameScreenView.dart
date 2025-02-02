import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/reusables.dart';
import 'addPatientNameScreenViewModel.dart';

class AddPatientNameScreenView extends StatelessWidget {
  static const routeName = "addPatientNameScreenViewModel";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddPatientNameScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBarWithLogoAndText(context, "", Text("Today")),
          body: SafeArea(
              child: Container(
            padding: const EdgeInsets.all(20.0),
            height: SizeConfig.screenHeight * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(50),
                ),
                Text(
                  "Enter patient name",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Form(
                    key: model.addCustomerNameFormKey,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => model.validateName(value),
                      keyboardType: TextInputType.name,
                      maxLength: 40,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: buildInputDecoration(
                          "Name",
                          Icon(
                            Icons.account_circle_rounded,
                            color: primaryColor,
                          )),
                      controller: model.newCustomerName,
                    )),
                Spacer(),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      buildOutlineButton(
                          "Continue", model.navigateTocustomerDetails)
                    ],
                  ),
                )
              ],
            ),
          )),
        );
      },
      viewModelBuilder: () => AddPatientNameScreenViewModel(),
    );
  }
}
