import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:volunteer_referral/screens/patient_add_screen.dart';
import '../widgets/patient_card.dart';

class PatientsListScreen extends StatefulWidget {
  const PatientsListScreen({super.key});

  @override
  State<PatientsListScreen> createState() => _PatientsListScreenState();
}

class _PatientsListScreenState extends State<PatientsListScreen> {
  List<Map<String, dynamic>> _items = [];

  final _patient_list = Hive.box("patient_box");

  Future<void> createPatient() async {
    await _patient_list.add({"name": "Hlyan Htet", "age": 22});
    print("Amount data is ${_patient_list.length}");
  }

  Future<void> clearPatient() async {
    await Hive.box('patient_box').clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clearPatient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Patients List",
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
                Icons.add,
              ),
              title: const Text('Add New Patient'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientAddScreen(),
                  ),
                );
              },
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
      // body: GestureDetector(
      //   onTap: createPatient,
      //   child: Container(
      //     color: Colors.blue,
      //     child: Text(
      //       "Hello",
      //     ),
      //   ),
      // )
      body: ListView(
        children: [
          PatientCard(),
          PatientCard(),
          PatientCard(),
          PatientCard(),
          PatientCard(),
        ],
      ),
    );
  }
}
