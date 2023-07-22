import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninja_id/pages/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
// import '../custom_widgets/custom_widget.dart';


class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference orders=FirebaseFirestore.instance.collection("Orders");
  // final TextEditingController _departmentTextController=TextEditingController();
  // final TextEditingController _nameTextController=TextEditingController();

  late String tea,samosa,pakora,department,name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,width: 300,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () async {
            await orders.add({
              'Pakora': pakora,
              'Samosa': samosa,
              'Tea': tea,
              'Department':department,
              'Name':name,
            }).then((value) async {
              print('Order Confirmed');
              final smtpServer = gmail('divyanshchauhan2002@gmail.com', 'mckunwodlalsnapl');
              final message = Message()
                ..from = const Address('divyanshchauhan2002@gmail.com', 'Divyansh Chauhan')
                ..recipients.add('201209@juitsolan.in')
                ..ccRecipients.add('divyanshchauhan2002@gmail.com.com')
                ..subject = 'Orders'
                ..text = 'To,\nOIC Canteen\nName:$name\tDepartment:$department\nPlease supply following items:'
                    '\nPakora: $pakora\nSamosa: $samosa\nTea: $tea';

              try {
                final sendReport = await send(message, smtpServer);
                print('Email sent: ${sendReport.toString()}');
              } catch (e) {
                print('Error occurred while sending email: $e');
              }
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
          ),
          child: const Text(
            'Order',
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Karla',
            ),
          ),
        ),

      ),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        title: const Text('UTCL Canteen',
          style: TextStyle(
            fontFamily:'Karla',
            fontSize: 25,
          ),),
        actions: [
          IconButton(
              icon: const Icon(
                  Icons.login_outlined,
                  color: Colors.white54,
                  size: 25.0),
              onPressed: (){
                 FirebaseAuth.instance.signOut().then((value) {
                   print("Signed Out");
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context)=>const SignInPage()));
                 });
              }
          ),
        ],
      ),
      body: Padding(

        padding: const EdgeInsets.all(18.0),
        child: Column(
          //backgroundColor:Colors.redAccent,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right:28.0),
                    child:
                    SizedBox(
                      width:150,
                      height: 50,
                      child: TextField(
                        onChanged: (value){
                          name=value;
                        },
                        textAlign:TextAlign.center,
                        decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21) ,

                            )
                        ),
                      ),
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(right:28.0),
                    child:
                    SizedBox(
                      width:150,
                      height: 50,
                      child: TextField(
                        onChanged: (value){
                          department=value;
                        },
                        textAlign:TextAlign.center,
                        decoration: InputDecoration(
                            labelText: 'Department',
                            labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21) ,

                            )
                        ),
                      ),
                    )
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(28),
                  child:
                  Text('Items',
                    style: TextStyle(
                      fontWeight:FontWeight.w500,
                      fontSize:27,
                      fontFamily:'Karla',
                    ),),
                ),

                Padding(
                  padding: EdgeInsets.all(28),
                  child:
                  Text('Quantity',
                    style: TextStyle(
                      fontWeight:FontWeight.w500,
                      fontSize:27,
                      fontFamily:'Karla',
                    ),),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(28.0),
                  child:
                  Text('Tea',
                    style: TextStyle(
                      fontWeight:FontWeight.normal,
                      fontSize:25,
                      fontFamily:'Karla',
                    ),),
                ),
                Padding(
                    padding: const EdgeInsets.only(right:28.0),
                    child:
                    SizedBox(
                      width:90,
                      height: 50,
                      child: TextField(
                        onChanged: (value){
                          tea=value;
                        },
                        textAlign:TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21) ,
                            )
                        ),
                      ),
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(28.0),
                  child:
                  Text('Samosas',
                    style: TextStyle(
                      fontWeight:FontWeight.normal,
                      fontSize:25,
                      fontFamily:'Karla',
                    ),),
                ),
                Padding(
                    padding: const EdgeInsets.all(28.0),
                    child:
                    SizedBox(
                      width:90,
                      height: 50,
                      child: TextField(
                        onChanged: (value){
                          samosa=value;
                        },
                        textAlign:TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21) ,
                            )
                        ),
                      ),
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(28.0),
                  child:
                  Text('Pakora',
                    style: TextStyle(
                      fontWeight:FontWeight.normal,
                      fontSize:25,
                      fontFamily:'Karla',
                    ),),
                ),
                Padding(
                    padding: const EdgeInsets.only(right:28.0),
                    child:
                    SizedBox(
                      width:90,
                      height: 50,
                      child: TextField(
                        onChanged: (value){
                          pakora=value;
                        },
                        textAlign:TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21) ,

                            )
                        ),
                      ),
                    )
                ),
              ],
            ),

          ],

        ),
      ),
    );
  }
}



