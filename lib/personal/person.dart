import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseAuth _authUser = FirebaseAuth.instance;
  String pay = "Card";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 17.0,
          ),
        ),
        title: Text(
          "My profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Information",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 160.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/images/profile.png",
                            height: 60.0,
                            width: 60.0,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: StreamBuilder<Object>(
                            stream: FirebaseFirestore.instance
                                .collection("Restaurant")
                                .doc(_authUser.currentUser!.uid.toString())
                                .snapshots(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CupertinoActivityIndicator());
                              } else {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      height: 8,
                                      color: Colors.black,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(2),
                                      child: Text(
                                        FirebaseAuth.instance.currentUser!.uid
                                            .toString(),
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(2),
                                      child: Text(
                                        FirebaseAuth.instance.currentUser!.email
                                            .toString(),
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Divider(
                                      height: 5,
                                      color: Colors.black,
                                    ),
                                   
                                    Container(
                                      padding: EdgeInsets.all(2),
                                      child: Text(
                                        "Trasaco hotel, behind navrongo\ncampus",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Divider(
                                      height: 6,
                                      color: Colors.black,
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Method",
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 230.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: [
                        RadioListTile(
                          value: "Card",
                          groupValue: pay,
                          onChanged: (String? sel) {
                            setState(() {
                              pay = sel!;
                            });
                          },
                          title: Row(
                            children: [
                              Container(
                                width: 35.0,
                                height: 35.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF47B0A),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Icon(
                                  Icons.payment,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "Card",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 70.0, right: 20.0),
                          child: Divider(
                            thickness: 0.5,
                          ),
                        ),
                        RadioListTile(
                          value: "Mobile",
                          groupValue: pay,
                          onChanged: (String? sel) {
                            setState(() {
                              pay = sel!;
                            });
                          },
                          title: Row(
                            children: [
                              Container(
                                width: 35.0,
                                height: 35.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFFEB4796),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Center(
                                    child: Icon(
                                  Icons.account_balance,
                                  color: Colors.white,
                                  size: 20.0,
                                )),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "Mobile Money (MTN,VODA)",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 70.0, right: 20.0),
                          child: Divider(
                            thickness: 0.5,
                          ),
                        ),
                        RadioListTile(
                          value: "Delivery",
                          groupValue: pay,
                          onChanged: (String? sel) {
                            setState(() {
                              pay = sel!;
                            });
                          },
                          title: Row(
                            children: [
                              Container(
                                width: 35.0,
                                height: 35.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFF0038FF),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.paypal,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "Pay on delivery",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 3.0, right: 3.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Update Information"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: Size(MediaQuery.of(context).size.width, 60.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
