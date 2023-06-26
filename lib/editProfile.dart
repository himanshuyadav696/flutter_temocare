import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class EditProfile extends StatefulWidget{
  @override
  State<EditProfile> createState() => _EditProfileState();
}
class _EditProfileState extends State<EditProfile>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                  children:[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Container(
                            width: double.infinity,
                            height: 170,
                            color: HexColor("#F2A56F"),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assests/images/backbutton.svg"),
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 115),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Card(
                                elevation: 4,
                                shape: CircleBorder(),
                                child: SvgPicture.asset("assests/images/ic_google.svg"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black,width: 1),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name",style: TextStyle(
                            fontSize: 14
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}