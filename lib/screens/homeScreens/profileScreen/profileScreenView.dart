import 'package:clinicapp/theme/theme.dart';
import 'package:clinicapp/widgets/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';

import 'profileScreenViewModel.dart';

class ProfileScreenView extends StatefulWidget {
  static const routeName = "/profileScreenView";
  @override
  _ProfileScreenViewState createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileScreenViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FadeInDTU(
                      0.3,
                      InkWell(
                        onTap: model.openClinicDetails,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: offWhite1),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.getClinicName,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      "Tap for details",
                                      style: TextStyle(
                                          fontSize: 12, color: offBlack3),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    model.getClinicLogoToShow != null
                                        ? CircleAvatar(
                                            child: ClipOval(
                                              child: Image.memory(
                                                model.getClinicLogoToShow,
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            radius: 25.0,
                                            backgroundColor: Colors.black12,
                                          )
                                        : CircleAvatar(
                                            radius: 25.0,
                                            backgroundColor: Colors.black12,
                                          ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Icon(
                                      AntDesign.right,
                                      size: 10,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeInDTU(
                      0.6,
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Divider(),
                            ListTile(
                              onTap: model.openClinicEmployeeDetails,
                              contentPadding: const EdgeInsets.all(10),
                              leading: Icon(
                                MaterialCommunityIcons.account,
                              ),
                              title: Text('Account Details'),
                              trailing: Icon(
                                AntDesign.right,
                                size: 10,
                              ),
                            ),
                            Divider(),
                            ListTile(
                              onTap: model.openShowPatientsDetails,
                              contentPadding: const EdgeInsets.all(10),
                              leading: Icon(
                                MaterialCommunityIcons.doctor,
                              ),
                              title: Text('Clinic Patients'),
                              trailing: Icon(
                                AntDesign.right,
                                size: 10,
                              ),
                            ),
                            ListTile(
                              onTap: model.openShowClinicEmployees,
                              contentPadding: const EdgeInsets.all(10),
                              leading: Icon(
                                MaterialCommunityIcons.bag_personal,
                              ),
                              title: Text('Clinic Employees'),
                              trailing: Icon(
                                AntDesign.right,
                                size: 10,
                              ),
                            ),
                            Divider(),
                            ListTile(
                              onTap: model.logOut,
                              contentPadding: const EdgeInsets.all(10),
                              leading: Icon(AntDesign.logout),
                              title: Text('Log Out'),
                              trailing: Icon(
                                AntDesign.right,
                                size: 10,
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => ProfileScreenViewModel());
  }
}
