import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import '../../../../model/doctor.dart';
import '../../../../app/size_configuration.dart';
import '../../../../theme/theme.dart';
import '../../../../widgets/reusables.dart';
import 'doctorsProfileScreenViewModel.dart';

class DoctorsProfileScreenView extends StatelessWidget {
  DoctorsProfileScreenView(
      {this.doctor, this.clinicDetails, this.isFromClinic});
  final Doctor doctor;
  final ClinicElement clinicDetails;
  final bool isFromClinic;

  static const routeName = "/doctorsProfileScreenView";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DoctorsProfileScreenViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBarWithLogoAndText(context, "", Text("")),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned(
                          top: getProportionateScreenHeight(50),
                          child: Container(
                            decoration: getUpperRoundedBorder(offWhite),
                            width: SizeConfig.screenWidth,
                            height: getProportionateScreenHeight(150),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    doctor.name,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  Text(doctor.specialization[0]),
                                  Text(((doctor.experience[0]
                                                  .experienceEndYear) -
                                              doctor.experience[0]
                                                  .experienceStartYear)
                                          .toString() +
                                      " years experience")
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.transparent,
                          child: CircleAvatar(
                            radius: 100.0,
                            backgroundColor: offWhite,
                            backgroundImage: NetworkImage(
                                'https://img.pngio.com/doc-doctor-pediatrician-icon-doctor-icon-png-512_512.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(130),
                  ),
                  !isFromClinic
                      ? !model.isBusy
                          ? Center(
                              child:
                                  buildBasicOutlineButtonWithLessPaddingAndRounderCornersWithCustomBackground(
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          "Add doctor to your clinic",
                                          style: TextStyle(
                                              color: white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      () => model.addThisDoctorToClinc(
                                          doctor.name, doctor.id),
                                      primaryColor),
                            )
                          : Center(
                              child:
                                  buildBasicOutlineButtonWithLessPaddingAndRounderCornersWithCustomBackground(
                                      Container(
                                        height: 25,
                                        width: 25,
                                        child: CircularProgressIndicator(
                                          backgroundColor: white,
                                        ),
                                      ),
                                      null,
                                      primaryColor),
                            )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              AntDesign.checkcircleo,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Text("Available today"),
                          ],
                        ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Divider(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   "Appointments",
                      //   style: TextStyle(
                      //       fontSize: 20,
                      //       color: blue,
                      //       fontWeight: FontWeight.w600),
                      // ),
                      // SizedBox(
                      //   height: getProportionateScreenHeight(20),
                      // ),
                      // Column(
                      //   children: [
                      //     Column(
                      //       children: [
                      //         Row(
                      //           children: [
                      //             Icon(
                      //               Icons.location_pin,
                      //               color: blue,
                      //             ),
                      //             SizedBox(
                      //               width: getProportionateScreenWidth(20),
                      //             ),
                      //             Text(
                      //               "Address",
                      //               style: TextStyle(color: offBlack2),
                      //             )
                      //           ],
                      //         ),
                      //         ListTile(
                      //           contentPadding:
                      //               const EdgeInsets.symmetric(horizontal: 40),
                      //           title: Text(doctor.address.homeAddress),
                      //           subtitle: Text(doctor.address.city +
                      //               " , " +
                      //               doctor.address.state +
                      //               " , " +
                      //               doctor.address.pinCode.toString()),
                      //         )
                      //       ],
                      //     ),
                      //     SizedBox(
                      //       height: getProportionateScreenHeight(20),
                      //     ),
                      //     Row(
                      //       children: [
                      //         Icon(
                      //           AntDesign.calendar,
                      //           color: blue,
                      //         ),
                      //         SizedBox(
                      //           width: getProportionateScreenWidth(20),
                      //         ),
                      //         Text(
                      //           "Dates",
                      //           style: TextStyle(color: offBlack2),
                      //         )
                      //       ],
                      //     ),
                      //     SizedBox(
                      //       height: getProportionateScreenHeight(20),
                      //     ),
                      //     GridView.builder(
                      //         itemCount: clinicDetails.days.length,
                      //         shrinkWrap: true,
                      //         primary: false,
                      //         gridDelegate:
                      //             SliverGridDelegateWithFixedCrossAxisCount(
                      //                 mainAxisSpacing: 10,
                      //                 crossAxisSpacing: 10,
                      //                 childAspectRatio: 3,
                      //                 crossAxisCount: 2),
                      //         itemBuilder: (context, index) =>
                      //             buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                      //                 Padding(
                      //                   padding: const EdgeInsets.symmetric(
                      //                       horizontal: 10),
                      //                   child: Column(
                      //                     children: [
                      //                       Text(
                      //                         clinicDetails.days
                      //                             .elementAt(index)
                      //                             .day,
                      //                         style: TextStyle(
                      //                             fontSize: 15,
                      //                             fontWeight: FontWeight.w300),
                      //                       ),
                      //                       Text(
                      //                         clinicDetails.days
                      //                                 .elementAt(index)
                      //                                 .startTime
                      //                                 .toString() +
                      //                             " to " +
                      //                             clinicDetails.days
                      //                                 .elementAt(index)
                      //                                 .endTime
                      //                                 .toString(),
                      //                         style: TextStyle(
                      //                             fontSize: 12,
                      //                             fontWeight: FontWeight.w300),
                      //                       )
                      //                     ],
                      //                   ),
                      //                 ),
                      //                 () {})),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: getProportionateScreenHeight(30),
                      // ),
                      // Column(
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Icon(
                      //           AntDesign.clockcircle,
                      //           color: blue,
                      //         ),
                      //         SizedBox(
                      //           width: getProportionateScreenWidth(20),
                      //         ),
                      //         Text(
                      //           "Time Slots",
                      //           style: TextStyle(color: offBlack2),
                      //         )
                      //       ],
                      //     ),
                      //     SizedBox(
                      //       height: getProportionateScreenHeight(20),
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                      //             Text(
                      //               "Morning",
                      //               style: TextStyle(
                      //                   fontSize: 12,
                      //                   fontWeight: FontWeight.w300),
                      //             ),
                      //             () {}),
                      //         buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                      //             Text(
                      //               "Noon",
                      //               style: TextStyle(
                      //                   fontSize: 12,
                      //                   fontWeight: FontWeight.w300),
                      //             ),
                      //             () {}),
                      //         buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                      //             Text(
                      //               "Evening",
                      //               style: TextStyle(
                      //                   fontSize: 12,
                      //                   fontWeight: FontWeight.w300),
                      //             ),
                      //             () {}),
                      //         buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                      //             Text(
                      //               "Night",
                      //               style: TextStyle(
                      //                   fontSize: 12,
                      //                   fontWeight: FontWeight.w300),
                      //             ),
                      //             () {}),
                      //       ],
                      //     ),
                      //     SizedBox(
                      //       height: getProportionateScreenHeight(20),
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                      //             Padding(
                      //               padding: const EdgeInsets.symmetric(
                      //                   horizontal: 5),
                      //               child: Text(
                      //                 "09:30 AM",
                      //                 style: TextStyle(
                      //                     fontSize: 15,
                      //                     fontWeight: FontWeight.w300),
                      //               ),
                      //             ),
                      //             () {}),
                      //         buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                      //             Padding(
                      //               padding: const EdgeInsets.symmetric(
                      //                   horizontal: 5),
                      //               child: Text(
                      //                 "10:00 AM",
                      //                 style: TextStyle(
                      //                     fontWeight: FontWeight.w300),
                      //               ),
                      //             ),
                      //             () {}),
                      //         buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                      //             Padding(
                      //               padding: const EdgeInsets.symmetric(
                      //                   horizontal: 5),
                      //               child: Text(
                      //                 "10:30 AM",
                      //                 style: TextStyle(
                      //                     fontWeight: FontWeight.w300),
                      //               ),
                      //             ),
                      //             () {}),
                      //       ],
                      //     )
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: getProportionateScreenHeight(10),
                      // ),
                      // Divider(
                      //   height: 10,
                      // ),
                      // SizedBox(
                      //   height: getProportionateScreenHeight(20),
                      // ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       "Chest specialist",
                      //       style: TextStyle(
                      //           fontSize: 20,
                      //           color: blue,
                      //           fontWeight: FontWeight.w600),
                      //     ),
                      //     SizedBox(
                      //       height: getProportionateScreenHeight(10),
                      //     ),
                      //     Text(
                      //         "A pulmonologist is a physician who specializes in the respiratory system. From the windpipe to the lungs, if your complaint involves the lungs or any part of the respiratory system, a pulmonologist is the doc  you want to solve the problem.")
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: getProportionateScreenHeight(10),
                      // ),
                      // Divider(
                      //   height: 10,
                      // ),
                      // SizedBox(
                      //   height: getProportionateScreenHeight(20),
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Text(
                              "Doctor Profile",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: blue,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Education",
                                style: TextStyle(color: offBlack3),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: doctor.education.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(15.0),
                                            tileColor: offWhite1,
                                            title: Text(doctor.education[index]
                                                .educationDegree),
                                            trailing: Text(doctor
                                                    .education[index]
                                                    .educationStartYear
                                                    .toString() +
                                                " - " +
                                                doctor.education[index]
                                                    .educationEndYear
                                                    .toString()),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(doctor.education[index]
                                                    .educationField),
                                                Text(doctor.education[index]
                                                    .educationCollege)
                                              ],
                                            )),
                                      ))
                            ],
                          ),
                          Divider(),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Specialization",
                                style: TextStyle(color: offBlack3),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              GridView.builder(
                                  primary: false,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          childAspectRatio: 3.5,
                                          crossAxisCount: 2),
                                  shrinkWrap: true,
                                  itemCount: doctor.specialization.length,
                                  itemBuilder: (context, index) =>
                                      buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                                          Text(
                                            doctor.specialization[index],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400),
                                          ),
                                          null)),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Divider(),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Experience",
                                style: TextStyle(color: offBlack3),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount: doctor.experience.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(15.0),
                                    tileColor: offWhite1,
                                    title: Text(doctor
                                        .experience[index].experienceTitle),
                                    trailing: Text(doctor.experience[index]
                                        .experienceOrganization),
                                    subtitle: Text(doctor.experience[index]
                                            .experienceStartYear
                                            .toString() +
                                        " - " +
                                        doctor
                                            .experience[index].experienceEndYear
                                            .toString()),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Divider(),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Services",
                                style: TextStyle(color: offBlack3),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              GridView.builder(
                                  primary: false,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          childAspectRatio: 3.5,
                                          crossAxisCount: 2),
                                  shrinkWrap: true,
                                  itemCount: doctor.specialization.length,
                                  itemBuilder: (context, index) =>
                                      buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                                          Text(
                                            doctor.services[index],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400),
                                          ),
                                          null)),
                              // ListView.builder(
                              //   primary: false,
                              //   shrinkWrap: true,
                              //   itemCount: doctor.services.length,
                              //   itemBuilder: (context, index) => Padding(
                              //     padding: const EdgeInsets.all(8.0),
                              //     child: ListTile(
                              //       tileColor: offWhite1,
                              //       title: Text(doctor.services[index]),
                              //     ),
                              //   ),
                              // ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
        );
      },
      viewModelBuilder: () => DoctorsProfileScreenViewModel(),
    );
  }
}
