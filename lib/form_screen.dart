import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pqt_third/authentication%20pages/main_authentication.dart';
import 'package:pqt_third/home_page.dart';
import './join_registration_queue.dart';

class FormScreen extends StatefulWidget {
  @override
  FormScreenState createState() => FormScreenState();
}

class FormScreenState extends State<FormScreen> {
  var doctorsName = [
    'Select Doctor',
    'Dr. Physician',
    'Dr. Dentist',
    'Dr. Gynaecologist',
    'Dr. Cardiologist'
  ];
  var currentDoctorSelected = 'Select Doctor';
  var physicianDiagnosis = [
    'Select Diagnosis',
    'Routine Check-up',
    'Falhana',
    'Dhimkana'
  ];
  var currentPhysicianDiagnosisSelected = 'Select Diagnosis';
  var dentistDiagnosis = [
    'Select Diagnosis',
    'Extraction',
    'Falhana',
    'Dhimkana',
    'Filling',
    'Root Canal',
    'Routine Check-up'
  ];
  var currentDentistDiagnosisSelected = 'Select Diagnosis';
  var gynaecDiagnosis = [
    'Select Diagnosis',
    'Routine Check-up',
    'Falhana',
    'Dhimkana',
    'Sonography'
  ];
  var currentGynaecDiagnosisSelected = 'Select Diagnosis';
  var cardioDiagnosis = [
    'Select Diagnosis',
    'Routine Check-up',
    'Falhana',
    'Dhimkana',
    'ECG'
  ];
  var currentCardioDiagnosisSelected = 'Select Diagnosis';

  void doctorDropdownSelected(String newDoctorSelected) {
    setState(() {
      this.currentDoctorSelected = newDoctorSelected;
    });
  }

  void physicianDiagnosisDropdownSelected(
      String newPhysicianDiagnosisSelected) {
    setState(() {
      this.currentPhysicianDiagnosisSelected = newPhysicianDiagnosisSelected;
    });
  }

  void dentistDiagnosisDropdownSelected(String newDentistDiagnosisSelected) {
    setState(() {
      this.currentDentistDiagnosisSelected = newDentistDiagnosisSelected;
    });
  }

  void gynaecDiagnosisDropdownSelected(String newGynaecDiagnosisSelected) {
    setState(() {
      this.currentGynaecDiagnosisSelected = newGynaecDiagnosisSelected;
    });
  }

  void cardioDiagnosisDropdownSelected(String newCardioDiagnosisSelected) {
    setState(() {
      this.currentCardioDiagnosisSelected = newCardioDiagnosisSelected;
    });
  }

  var physicianTimeSlots = [
    'Select Time Slot',
    '8:00 am - 8:15 am',
    '8:15 am - 8:30 am',
    '8:30 am - 8:45 am',
    '8:45 am - 9:00 am',
    '9:00 am - 9:15 am',
    '9:15 am - 9:30 am',
    '9:30 am - 9:45 am',
    '9:45 am - 10:00 am'
  ];
  var currentPhysicianTimeSlot = 'Select Time Slot';
  var dentistTimeSlots = [
    'Select Time Slot',
    '8:00 am - 8:30 am',
    '8:30 am - 9:00 am',
    '9:00 am - 9:30 am',
    '9:30 am - 10:00 am'
  ];
  var currentDentistTimeSlot = 'Select Time Slot';
  var gynaecTimeSlots = [
    'Select Time Slot',
    '8:00 am - 8:30 am',
    '8:30 am - 9:00 am',
    '9:00 am - 9:30 am',
    '9:30 am - 10:00 am'
  ];
  var currentGynaecTimeSlot = 'Select Time Slot';
  var cardioTimeSlots = [
    'Select Time Slot',
    '8:00 am - 8:30 am',
    '8:30 am - 9:00 am',
    '9:00 am - 9:30 am',
    '9:30 am - 10:00 am'
  ];

  var currentCardioTimeSlot = 'Select Time Slot';

  void physicianTimeSlotDropdownSelected(String newPhysicianTimeSlotSelected) {
    setState(() {
      this.currentPhysicianTimeSlot = newPhysicianTimeSlotSelected;
    });
  }

  void dentistTimeSlotDropdownSelected(String newDentistTimeSlotSelected) {
    setState(() {
      this.currentDentistTimeSlot = newDentistTimeSlotSelected;
    });
  }

  void gynaecTimeSlotDropdownSelected(String newGynaecTimeSlotSelected) {
    setState(() {
      this.currentGynaecTimeSlot = newGynaecTimeSlotSelected;
    });
  }

  void cardioTimeSlotDropdownSelected(String newCardioTimeSlotSelected) {
    setState(() {
      this.currentCardioTimeSlot = newCardioTimeSlotSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment Details"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select the appionted doctor's name:",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
              items: doctorsName.map((String doctorDropdown) {
                return DropdownMenuItem<String>(
                    value: doctorDropdown, child: Text(doctorDropdown));
              }).toList(),
              onChanged: (String newDoctorSelected) {
                doctorDropdownSelected(newDoctorSelected);
              },
              value: currentDoctorSelected,
              isExpanded: true,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Select the type of Diagnosis:',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            (currentDoctorSelected == doctorsName[1])
                ? DropdownButton<String>(
                    items: physicianDiagnosis.map((String physicianDropdown) {
                      return DropdownMenuItem<String>(
                          value: physicianDropdown,
                          child: Text(physicianDropdown));
                    }).toList(),
                    onChanged: (currentDoctorSelected == doctorsName[0])
                        ? null
                        : (String newDiagnosisSelected) {
                            physicianDiagnosisDropdownSelected(
                                newDiagnosisSelected);
                          },
                    value: currentPhysicianDiagnosisSelected,
                    isExpanded: true,
                    disabledHint: Text(
                      'Please select doctor\'s name first',
                      textAlign: TextAlign.center,
                    ),
                  )
                : (currentDoctorSelected == doctorsName[2])
                    ? DropdownButton<String>(
                        items: dentistDiagnosis.map((String dentistDropdown) {
                          return DropdownMenuItem<String>(
                              value: dentistDropdown,
                              child: Text(dentistDropdown));
                        }).toList(),
                        onChanged: (currentDoctorSelected == doctorsName[0])
                            ? null
                            : (String newDiagnosisSelected) {
                                dentistDiagnosisDropdownSelected(
                                    newDiagnosisSelected);
                              },
                        value: currentDentistDiagnosisSelected,
                        isExpanded: true,
                        disabledHint: Text(
                          'Please select doctor\'s name first',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : (currentDoctorSelected == doctorsName[3])
                        ? DropdownButton<String>(
                            items: gynaecDiagnosis.map((String gynaecDropdown) {
                              return DropdownMenuItem<String>(
                                  value: gynaecDropdown,
                                  child: Text(gynaecDropdown));
                            }).toList(),
                            onChanged: (currentDoctorSelected == doctorsName[0])
                                ? null
                                : (String newDiagnosisSelected) {
                                    gynaecDiagnosisDropdownSelected(
                                        newDiagnosisSelected);
                                  },
                            value: currentGynaecDiagnosisSelected,
                            isExpanded: true,
                            disabledHint: Text(
                              'Please select doctor\'s name first',
                              textAlign: TextAlign.center,
                            ),
                          )
                        : DropdownButton<String>(
                            items: cardioDiagnosis.map((String cardioDropdown) {
                              return DropdownMenuItem<String>(
                                  value: cardioDropdown,
                                  child: Text(cardioDropdown));
                            }).toList(),
                            onChanged: (currentDoctorSelected == doctorsName[0])
                                ? null
                                : (String newDiagnosisSelected) {
                                    cardioDiagnosisDropdownSelected(
                                        newDiagnosisSelected);
                                  },
                            value: currentCardioDiagnosisSelected,
                            isExpanded: true,
                            disabledHint: Text(
                              'Please select doctor\'s name first',
                              textAlign: TextAlign.center,
                            ),
                          ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Select Appointment Time Slot:",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            (currentDoctorSelected == doctorsName[1])
                ? DropdownButton<String>(
                    items: physicianTimeSlots.map((String pTimeSlotDropdown) {
                      return DropdownMenuItem<String>(
                          value: pTimeSlotDropdown,
                          child: Text(pTimeSlotDropdown));
                    }).toList(),
                    onChanged: (currentPhysicianDiagnosisSelected ==
                            physicianDiagnosis[0])
                        ? null
                        : (String newPhysicianTimeSlotSelected) {
                            physicianTimeSlotDropdownSelected(
                                newPhysicianTimeSlotSelected);
                          },
                    value: currentPhysicianTimeSlot,
                    isExpanded: true,
                    disabledHint: Text(
                      'Please select type of diagnosis first',
                      textAlign: TextAlign.center,
                    ),
                  )
                : (currentDoctorSelected == doctorsName[2])
                    ? DropdownButton<String>(
                        items: dentistTimeSlots.map((String dTimeSlotDropdown) {
                          return DropdownMenuItem<String>(
                              value: dTimeSlotDropdown,
                              child: Text(dTimeSlotDropdown));
                        }).toList(),
                        onChanged: (currentDentistDiagnosisSelected ==
                                dentistDiagnosis[0])
                            ? null
                            : (String newDentistTimeSlotSelected) {
                                dentistTimeSlotDropdownSelected(
                                    newDentistTimeSlotSelected);
                              },
                        value: currentDentistTimeSlot,
                        isExpanded: true,
                        disabledHint: Text(
                          'Please select type of diagnosis first',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : (currentDoctorSelected == doctorsName[3])
                        ? DropdownButton<String>(
                            items:
                                gynaecTimeSlots.map((String gTimeSlotDropdown) {
                              return DropdownMenuItem<String>(
                                  value: gTimeSlotDropdown,
                                  child: Text(gTimeSlotDropdown));
                            }).toList(),
                            onChanged: (currentGynaecDiagnosisSelected ==
                                    gynaecDiagnosis[0])
                                ? null
                                : (String newGynaecTimeSlotSelected) {
                                    gynaecTimeSlotDropdownSelected(
                                        newGynaecTimeSlotSelected);
                                  },
                            value: currentGynaecTimeSlot,
                            isExpanded: true,
                            disabledHint: Text(
                              'Please select type of diagnosis first',
                              textAlign: TextAlign.center,
                            ),
                          )
                        : DropdownButton<String>(
                            items:
                                cardioTimeSlots.map((String cTimeSlotDropdown) {
                              return DropdownMenuItem<String>(
                                  value: cTimeSlotDropdown,
                                  child: Text(cTimeSlotDropdown));
                            }).toList(),
                            onChanged: (currentCardioDiagnosisSelected ==
                                    cardioDiagnosis[0])
                                ? null
                                : (String newCardioTimeSlotSelected) {
                                    cardioTimeSlotDropdownSelected(
                                        newCardioTimeSlotSelected);
                                  },
                            value: currentCardioTimeSlot,
                            isExpanded: true,
                            disabledHint: Text(
                              'Please select type of diagnosis first',
                              textAlign: TextAlign.center,
                            ),
                          ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.blue,
                  child: Text(
                    'Submit',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: ((currentPhysicianTimeSlot ==
                              physicianTimeSlots[0]) &&
                          (currentDentistTimeSlot == dentistTimeSlots[0]) &&
                          (currentGynaecTimeSlot == gynaecTimeSlots[0]) &&
                          (currentCardioTimeSlot == cardioTimeSlots[0]))
                      ? null
                      : () {
                          FirebaseFirestore.instance
                              .collection('patients')
                              .doc('EmailId')
                              .update(
                                  // 'patient_id': Uuid().v4(),
                                  (currentDoctorSelected == doctorsName[1] &&
                                          currentPhysicianDiagnosisSelected ==
                                              physicianDiagnosis[1])
                                      ? {
                                          'Doctor': currentDoctorSelected,
                                          'Diagnosis':
                                              currentPhysicianDiagnosisSelected
                                        }
                                      : (currentDoctorSelected == doctorsName[1] &&
                                              currentPhysicianDiagnosisSelected ==
                                                  physicianDiagnosis[2])
                                          ? {
                                              'Doctor': currentDoctorSelected,
                                              'Diagnosis':
                                                  currentPhysicianDiagnosisSelected
                                            }
                                          : (currentDoctorSelected ==
                                                      doctorsName[1] &&
                                                  currentPhysicianDiagnosisSelected ==
                                                      physicianDiagnosis[3])
                                              ? {
                                                  'Doctor':
                                                      currentDoctorSelected,
                                                  'Diagnosis':
                                                      currentPhysicianDiagnosisSelected
                                                }
                                              : (currentDoctorSelected ==
                                                          doctorsName[2] &&
                                                      currentPhysicianDiagnosisSelected ==
                                                          dentistDiagnosis[1])
                                                  ? {
                                                      'Doctor':
                                                          currentDoctorSelected,
                                                      'Diagnosis':
                                                          currentDentistDiagnosisSelected
                                                    }
                                                  : (currentDoctorSelected ==
                                                              doctorsName[2] &&
                                                          currentDentistDiagnosisSelected ==
                                                              dentistDiagnosis[
                                                                  2])
                                                      ? {
                                                          'Doctor':
                                                              currentDoctorSelected,
                                                          'Diagnosis':
                                                              currentDentistDiagnosisSelected
                                                        }
                                                      : (currentDoctorSelected == doctorsName[2] &&
                                                              currentDentistDiagnosisSelected ==
                                                                  dentistDiagnosis[
                                                                      3])
                                                          ? {
                                                              'Doctor':
                                                                  currentDoctorSelected,
                                                              'Diagnosis':
                                                                  currentDentistDiagnosisSelected
                                                            }
                                                          : (currentDoctorSelected == doctorsName[2] &&
                                                                  currentDentistDiagnosisSelected ==
                                                                      dentistDiagnosis[
                                                                          4])
                                                              ? {
                                                                  'Doctor':
                                                                      currentDoctorSelected,
                                                                  'Diagnosis':
                                                                      currentDentistDiagnosisSelected
                                                                }
                                                              : (currentDoctorSelected == doctorsName[2] &&
                                                                      currentDentistDiagnosisSelected ==
                                                                          dentistDiagnosis[
                                                                              5])
                                                                  ? {
                                                                      'Doctor':
                                                                          currentDoctorSelected,
                                                                      'Diagnosis':
                                                                          currentDentistDiagnosisSelected
                                                                    }
                                                                  : (currentDoctorSelected == doctorsName[2] &&
                                                                          currentDentistDiagnosisSelected ==
                                                                              dentistDiagnosis[
                                                                                  6])
                                                                      ? {
                                                                          'Doctor':
                                                                              currentDoctorSelected,
                                                                          'Diagnosis':
                                                                              currentDentistDiagnosisSelected
                                                                        }
                                                                      : (currentDoctorSelected == doctorsName[3] &&
                                                                              currentGynaecDiagnosisSelected == gynaecDiagnosis[1])
                                                                          ? {'Doctor': currentDoctorSelected, 'Diagnosis': currentGynaecDiagnosisSelected}
                                                                          : (currentDoctorSelected == doctorsName[3] && currentGynaecDiagnosisSelected == gynaecDiagnosis[2])
                                                                              ? {'Doctor': currentDoctorSelected, 'Diagnosis': currentGynaecDiagnosisSelected}
                                                                              : {'Successfull': 'Done'}); //uptil Gynaec diagnosis at i = 2
                          // .then((value) => value.id)
                          // .then((id) => FirebaseFirestore.instance
                          //     .collection('patients')
                          //     .doc(id)
                          // .update((currentDoctorSelected ==
                          //             doctorsName[1] &&
                          //         currentPhysicianDiagnosisSelected ==
                          //             physicianDiagnosis[1])
                          //     ? {
                          //         'Doctor': currentDoctorSelected,
                          //         'Diagnosis':
                          //             currentPhysicianDiagnosisSelected
                          //       }
                          //     : (currentDoctorSelected ==
                          //                 doctorsName[1] &&
                          //             currentPhysicianDiagnosisSelected ==
                          //                 physicianDiagnosis[2])
                          //         ? {
                          //             'Doctor': currentDoctorSelected,
                          //             'Diagnosis':
                          //                 currentPhysicianDiagnosisSelected
                          //           }
                          //         : (currentDoctorSelected ==
                          //                     doctorsName[1] &&
                          //                 currentPhysicianDiagnosisSelected ==
                          //                     physicianDiagnosis[3])
                          //             ? {
                          //                 'Doctor':
                          //                     currentDoctorSelected,
                          //                 'Diagnosis':
                          //                     currentPhysicianDiagnosisSelected
                          //               }
                          //             : {'SUCCESSFULL': 'Bhot Sahi'}));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JoinRegistration()),
                          );
                        }),
            )
          ],
        ),
      ),
    );
  }
}
