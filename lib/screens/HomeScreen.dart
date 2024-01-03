import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:temocare_flutter/Api/ApiConstants.dart';
import 'package:temocare_flutter/screens/BookNow.dart';
import 'package:temocare_flutter/screens/ProfilesScreen.dart';
import 'package:temocare_flutter/screens/myAppointment.dart';
import 'package:temocare_flutter/screens/profileDetail.dart';
import 'package:temocare_flutter/sharedPreferences/SharedPreferencesUtil.dart';
import '../Models/DoctorData.dart';
import '../apputils/utils.dart';
import 'doctorDetail.dart';
class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:BottomNavigationBarExampleApp()
    );
  }
}

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const BookNow(),
    const myAppointment(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'My Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  _HomePageState createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage> {
  String firstName = "";
  String lastName ="";
  var profile;
  var accessToken;
  var results = [];
  bool _loading = false;
  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
    getDoctorList();
  }
  void getDoctorList() async {
    setState(() {
      _loading = true;
    });
    try {
      var apiUrl = ApiConstants.baseUrl+ApiConstants.getDoctorListEndPoint;
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if(data['error']==null){
          var responseData = data['response']['data']['results'];
          print('Response Data: $responseData');
          setState(() {
            results = responseData;
            _loading = false;
          });
          print("doctor fetched lis :$results");
          var success = data['response']['message']['success'];
          var successCode = data['response']['message']['successCode'];
          var statusCode = data['response']['message']['statusCode'];
          var successMessage = data['response']['message']['successMessage'];
          toastMessage(successMessage);
        }
        else{
          String errorMessage = data['error']['errorMessage'];
          print('Error: ${data['error']['errorMessage']}');
          toastMessage(errorMessage);
          setState(() {
            _loading = false;
          });
        }
      } else {
         print('Error: ${response.statusCode}');
         setState(() {
           _loading = false;
         });
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        _loading = false;
      });
    }
  }

  void _initSharedPreferences() async {
    setState(() async {
      firstName = (await SharedPreferencesUtil.getString("firstName"))!;
      lastName = (await SharedPreferencesUtil.getString("lastName"))!;
      profile = await SharedPreferencesUtil.getString("profileImage");
      accessToken = await SharedPreferencesUtil.getString("accessToken");
      profile = await SharedPreferencesUtil.getString("profilePic");
    });
    print(firstName);
    print(lastName);
    print(profile);
    print(accessToken);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text("Hello",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "$firstName $lastName",
                          softWrap: true,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return const ProfileDetail();
                        }));
                      },
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Card(
                          elevation: 5,
                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                          child: Image.network(profile.toString(),height: 50,width: 50,)
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 160,
                    child: Card(
                        color: HexColor("#F2A56F"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(top: 50,bottom: 40,left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Get the best",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Flexible(
                                    child: Text("Medical Services",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: SizedBox(
                                  height: 200,
                                  width: 100,
                                  child: Image.asset("assests/images/iv_doctor.png")
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                ),
                _loading?
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0,right: 40,top: 60),
                      child: CircularProgressIndicator(),
                    ):
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:results == null ? 0 : results.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child:Container(
                          width: double.infinity,
                          height: 140,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                  height:90,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: const BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(results[index]['image_url'].toString(),
                                        fit: BoxFit.fitHeight,
                                      )),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(results[index]['fullName'],style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),),
                                          Text(results[index]['specialization'].toString(),style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                          Row(
                                            children: [
                                              Text("\$${results[index]['fee']}",style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500
                                              ),),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: Text(" | ${results[index]['experience']} Years",style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500
                                                ),),
                                              ),

                                            ],
                                          ),
                                          InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                                return  DoctorDetail(doctorData:DoctorData(
                                                    doctorId: results[index]["doctor_id"].toString(),
                                                    doctorName: results[index]["fullName"],
                                                    specialization: results[index]["specialization"],
                                                    quali: results[index]["qualifi"],
                                                    experience: results[index]["experience"],
                                                    descrition: results[index]["description"],
                                                    rating: results[index]["ratings"],
                                                    reviews: results[index]["reviews"].toString(),
                                                    successfull_patients: results[index]["successfull_patients"].toString(),
                                                    fees: results[index]["fee"].toString()
                                                ));
                                              }));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 10,top: 5),
                                              child: Container(
                                                width: double.infinity,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: HexColor("#ED787E")),
                                                    borderRadius: const BorderRadius.all(Radius.circular(30))
                                                ),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Expanded(
                                                    child: Text("Appointment",style: TextStyle(
                                                        color: HexColor("#ED787E"),
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 16
                                                    ),),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerScren extends StatelessWidget{
  const DrawerScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Handle item tap
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Handle item tap
              Navigator.pop(context); // Close the drawer
            },
          ),
          // Add more items as needed
        ],
      ),
    ),
    );
  }

}


