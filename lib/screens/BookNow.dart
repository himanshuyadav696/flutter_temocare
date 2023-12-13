import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:temocare_flutter/sharedPreferences/SharedPreferencesUtil.dart';
import '../Api/ApiConstants.dart';
import 'package:http/http.dart' as http;
import '../Models/DoctorData.dart';
import '../apputils/utils.dart';
import 'doctorDetail.dart';
class BookNow extends StatefulWidget{
  @override
  State<BookNow> createState() => _BookNowState();
}

class _BookNowState extends State<BookNow>{
  var results = [];
  @override
  void initState() {
    super.initState();
    getDoctorList();
  }
  Future<void> getDoctorList() async {
    try {
      var apiUrl = ApiConstants.baseUrl+ApiConstants.getDoctorListEndPoint;
      var accessToken = SharedPreferencesUtil.getString("accessToken");
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
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
   return SafeArea(child: Scaffold(
     body: Scaffold(
       body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(
             children: [
               ListView.builder(
                   physics: NeverScrollableScrollPhysics(),
                   itemCount:results == null ? 0 : results.length,
                   shrinkWrap: true,
                   itemBuilder: (BuildContext context, int index) {
                     return Padding(
                       padding: const EdgeInsets.only(top: 5,bottom: 5),
                       child: Container(
                         width: double.infinity,
                         height: 110,
                         decoration: BoxDecoration(
                           border: Border.all(color: Colors.grey),
                           color: Colors.white,
                           borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                     borderRadius: BorderRadius.all(Radius.circular(10))
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
                                     padding: const EdgeInsets.only(top: 15),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text(results[index]['fullName'],style: TextStyle(
                                           color: Colors.black,
                                           fontSize: 20,
                                           fontWeight: FontWeight.w500,
                                         ),),
                                         Text(results[index]['specialization'].toString(),style: TextStyle(
                                           fontSize: 16,
                                           color: Colors.grey,
                                           fontWeight: FontWeight.w400,
                                         ),),
                                         Row(
                                           children: [
                                             Text("\$${results[index]['fee']}",style: TextStyle(
                                                 color: Colors.black,
                                                 fontWeight: FontWeight.w500
                                             ),),
                                             Padding(
                                               padding: const EdgeInsets.only(right: 10),
                                               child: Text(" | ${results[index]['experience']} Years",style: TextStyle(
                                                   color: Colors.black,
                                                   fontWeight: FontWeight.w500
                                               ),),
                                             ),
                                             Expanded(
                                               child: InkWell(
                                                 onTap: (){
                                                 Navigator.push(context, MaterialPageRoute(builder: (context){
                                                   return  DoctorDetail(doctorData: DoctorData(
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
                                                   ),);
                                                 }));
                                                 },
                                                 child: Padding(
                                                   padding: const EdgeInsets.only(right: 10),
                                                   child: Container(
                                                     width: 140,
                                                     height: 40,
                                                     decoration: BoxDecoration(
                                                         border: Border.all(color: HexColor("#ED787E")),
                                                         borderRadius: BorderRadius.all(Radius.circular(30))
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
                                             ),
                                           ],
                                         )
                                       ],
                                     ),
                                   ),
                                 ))
                           ],
                         ),
                       ),
                     );
                   })
             ],
           ),
         ),
       ),
     ),
   ));
  }
}
