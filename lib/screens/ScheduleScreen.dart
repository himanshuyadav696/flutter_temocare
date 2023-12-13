import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../Api/ApiConstants.dart';
import 'package:http/http.dart' as http;
import '../apputils/utils.dart';
import '../sharedPreferences/SharedPreferencesUtil.dart';
class ScheduleScreen extends StatefulWidget{
  final String doctorId;
  ScheduleScreen({required this.doctorId});
  @override
  State<ScheduleScreen> createState() => _ScheduleScreen();
}
class _ScheduleScreen extends State<ScheduleScreen>{
  List<String> check= ["12","13","14","15","16"];
  int selectedDate = -1;
  int selectedSlot = -1;
  var slots = [];
  var finalDocorId;
  @override
  void initState() {
    finalDocorId = widget.doctorId;
    getDoctorList(finalDocorId.toString());
  }
  Future<void> getDoctorList(finalDocorId) async {
    var apiUrl = ApiConstants.baseUrl+ApiConstants.postDateByDoctorId;
    var accessToken = await SharedPreferencesUtil.getString("accessToken");
    var response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'doctor_id':finalDocorId
      },
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if(data['error']==null){
        var responseData = data['response']['data']['slots'];
        print('Response Data: $responseData');
        setState(() {
          slots = responseData;
        });
        print("doctor fetched lis :$slots");
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
      }
    } else {
      print('Error: ${response.statusCode}');
      print('Error: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: SvgPicture.asset("assests/images/backbutton.svg"),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Text(
                      "Schedule",style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 58,
                    height: 58,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: slots == null ? 0 : slots.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context,int index){
                          DateTime originalDate = DateTime.parse(slots[index]['slotDate2']);
                          String formattedDate = DateFormat('dd-MM-yyyy').format(originalDate);
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedDate = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                height: 80,
                                width: 64,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  color: index == selectedDate ? Colors.pink : Colors.white,
                                  elevation: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("${formattedDate.substring(0,2)}",style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          color: index == selectedDate?Colors.white:Colors.black
                                      ),),
                                      Text(slots[index]['day'].toString().substring(0,3),style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: index == selectedDate?Colors.white:Colors.black
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text("Available Slots",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                    ),),
                  ),
                  Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 20,
                            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // Number of columns
                                crossAxisSpacing: 8, // Spacing between columns
                                mainAxisSpacing: 2,
                                mainAxisExtent: 55
                            ),itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedSlot = index;
                              });
                            },
                            child: Container(
                              child: Wrap(
                                  children:[Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    color: index == selectedSlot ? Colors.pink : Colors.white,
                                    elevation: 3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Wrap(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: Text("$index:00 Am",
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w500,
                                                        color: index == selectedSlot?Colors.white:Colors.black,
                                                      ),),
                                                  ),
                                                ],
                                              ),
                                            ]
                                        ),
                                      ],
                                    ),
                                  ),]
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text("Durations",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16,right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assests/images/ic_clock.svg"),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text("30 Minutes",style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400
                                  ),),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset("assests/images/dropIcon.svg")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16,right: 16),
                        child: Row(
                          children: [
                            SvgPicture.asset("assests/images/yellow_video.svg"),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Expanded(child: Center(
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("VideoCall",style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500
                                        ),),
                                        Text("VideoCall with doctor",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400
                                        ),),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("\$99",style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500
                                          ),),
                                          Text("| 30 min",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400
                                            ),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(onPressed: () {

                      }, style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.pink),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ))
                      ), child:  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Next",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),),
                      ),),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
