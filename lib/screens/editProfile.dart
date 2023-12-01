import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,top: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Text("Name",style: TextStyle(
                                  fontSize: 16,
                                  color: HexColor("#82B8BC"),
                                  fontWeight: FontWeight.w400
                                ),),
                              ),
                              const Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Lucy",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Text("Last Name",style: TextStyle(
                                    fontSize: 16,
                                    color: HexColor("#82B8BC"),
                                    fontWeight: FontWeight.w400
                                ),),
                              ),
                              const Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  keyboardType: TextInputType.name,
                                  style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Martin",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Text("Email",style: TextStyle(
                                    fontSize: 16,
                                    color: HexColor("#82B8BC"),
                                    fontWeight: FontWeight.w400
                                ),),
                              ),
                              const Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "lucy@yopmail.com",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Text("Age",style: TextStyle(
                                    fontSize: 16,
                                    color: HexColor("#82B8BC"),
                                    fontWeight: FontWeight.w400
                                ),),
                              ),
                              const Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "18",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Text("Gender",style: TextStyle(
                                    fontSize: 16,
                                    color: HexColor("#82B8BC"),
                                    fontWeight: FontWeight.w400
                                ),),
                              ),
                              const Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Male",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 60,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)))
                            ),
                              onPressed: (){
                              Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                child: Text("Update",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600
                                ),
                          ),
                              )),
                        ),
                        Container(
                          height: 60,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                              side: MaterialStateProperty.all(BorderSide(color: Colors.pink,width: 2))
                            ),
                              onPressed: (){
                              Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                child: Text("Cancel",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600
                                ),
                                ),
                              )),
                        )
                      ],
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