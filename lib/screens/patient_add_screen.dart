import 'package:flutter/material.dart';
import 'package:volunteer_referral/widgets/custom_textfield.dart';
import 'package:intl/intl.dart';
import '../widgets/custom_button.dart';

class PatientAddScreen extends StatefulWidget {
  PatientAddScreen({super.key});

  @override
  State<PatientAddScreen> createState() => _PatientAddScreenState();
}

class _PatientAddScreenState extends State<PatientAddScreen> {
  final usernameController = TextEditingController();
  String gender = "male";
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final dateInput = TextEditingController();
  String vot = 'Yes';

  void handlePatientAdd() {
    print(usernameController.text);
    print(gender);
    print(ageController);
    print(addressController);
    print(dateInput);
    print(vot);
  }

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "UNION Volunteer App",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Text('Settings'),
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                ),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Add New Patient",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: CustomTextField(
                      hintText: "Name",
                      obscureText: false,
                      controller: usernameController,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          title: const Text("Male"),
                          value: "male",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          title: const Text("Female"),
                          value: "female",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: CustomTextField(
                      hintText: "Age",
                      obscureText: false,
                      controller: ageController,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: CustomTextField(
                      hintText: "Address",
                      obscureText: true,
                      controller: addressController,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    // height: MediaQuery.of(context).size.width / 3,
                    child: Center(
                      child: TextField(
                        controller: dateInput,
                        //editing controller of this TextField
                        decoration: const InputDecoration(
                          hintText: "Treatment start date",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate);
                            setState(() {
                              dateInput.text = formattedDate;
                            });
                          } else {}
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("VOT"),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    // width: double.infinity,

                    alignment: Alignment.center,
                    child: DropdownButton<String>(
                      value: vot,
                      onChanged: (String? newValue) {
                        setState(() {
                          vot = newValue as String;
                        });
                      },
                      items: <String>[
                        'Yes',
                        'No',
                      ].map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  CustomButton(
                    onTap: handlePatientAdd,
                    buttonName: "Submit",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
