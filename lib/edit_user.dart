import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home_button.dart';
import 'my_account_page.dart';
import 'navbar.dart';

class EditUser extends StatelessWidget {
  final GoogleSignInAccount user;
  final GoogleSignIn googleSignIn;
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('Users');

  EditUser(this.user, this.googleSignIn, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tempName;
    String tempMobile;
    String tempBank;
    String tempBio;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 168, 159, 104),
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('edit user',
              style: TextStyle(
                  color: Color.fromARGB(255, 65, 82, 31), fontSize: 28)),
          backgroundColor: const Color.fromARGB(255, 245, 253, 198),
          leading: homeButton(context, user, googleSignIn)),
      bottomNavigationBar: buildNavBar(context, user, googleSignIn),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // Name Entry
            FutureBuilder<DocumentSnapshot>(
              future: usersRef.doc(user.id).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data.data() as Map<String, dynamic>;
                  tempName = "${data['name']}";
                  return TextFormField(
                    initialValue: "${data['name']}",
                    maxLength: 30,
                    onChanged: (text) {
                      tempName = text;
                    },
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 65, 82, 31)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 65, 82, 31)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Name',
                        hintText: 'How you want to be addressed',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 65, 82, 31))),
                  );
                }
                return const Text(
                  "loading...",
                );
              },
            ),

            // Mobile No Entry
            FutureBuilder<DocumentSnapshot>(
              future: usersRef.doc(user.id).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data.data() as Map<String, dynamic>;
                  tempMobile = "${data['mobileNo']}";
                  return TextFormField(
                    initialValue: "${data['mobileNo']}",
                    maxLength: 8,
                    keyboardType: TextInputType.phone,
                    onChanged: (mobileNo) {
                      tempMobile = mobileNo;
                    },
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 65, 82, 31)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 65, 82, 31)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.phone),
                      labelText: 'Mobile Number',
                      hintText: 'Used for Paylah/PayNow',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 65, 82, 31)),
                    ),
                  );
                }
                return const Text("loading...");
              },
            ),
            // BankAccNo Entry
            FutureBuilder<DocumentSnapshot>(
              future: usersRef.doc(user.id).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data.data() as Map<String, dynamic>;
                  tempBank = "${data['bankAccNo']}";
                  return TextFormField(
                    initialValue: "${data['bankAccNo']}",
                    maxLength: 16,
                    keyboardType: TextInputType.number,
                    onChanged: (accNo) {
                      tempBank = accNo;
                    },
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 65, 82, 31)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 65, 82, 31)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.account_balance_wallet),
                      labelText: 'Bank Account Number',
                      hintText: '1234 5678 9098 7654',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 65, 82, 31)),
                    ),
                  );
                }
                return const Text("loading...");
              },
            ),

            // Bio Entry
            FutureBuilder<DocumentSnapshot>(
              //Fetching data from the documentId specified of the user
              future: usersRef.doc(user.id).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                //Data is output to the user
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data.data() as Map<String, dynamic>;
                  tempBio = "${data['bio']}";
                  return TextFormField(
                    maxLength: 150,
                    onChanged: (bio) {
                      tempBio = bio;
                    },
                    initialValue: "${data['bio']}",
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 65, 82, 31)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 65, 82, 31)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.person),
                      labelText: 'Bio',
                      hintText: 'About yourself',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 65, 82, 31)),
                    ),
                  );
                }

                return const Text(
                  "loading...",
                );
              },
            ),

            Row(children: <Widget>[
              IconButton(
                  onPressed: () {
                    // Navigate back to first route when tapped.
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 238, 238, 238),
                  ),
                  onPressed: () {
                    confirmChangesAlert(
                        context, tempName, tempMobile, tempBank, tempBio);
                  },
                  child: const Text(
                    'Save Profile',
                    style: TextStyle(color: Color.fromARGB(255, 65, 82, 31)),
                  ))
            ]),
          ],
        ),
      ),
    );
  }

  confirmChangesAlert(BuildContext context, String name, String mobileNo,
      String bankAccNo, String bio) {
    // set up the buttons
    IconButton cancelButton = IconButton(
      icon: const Icon(Icons.cancel),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget confirmButton = IconButton(
      icon: const Icon(Icons.check),
      onPressed: () async {
        await usersRef.doc(user.id).set({
          "name": name,
          "mobileNo": mobileNo,
          "bankAccNo": bankAccNo,
          "bio": bio,
          "dp": user.photoUrl,
        }).then((value) => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyAccountPage(user, googleSignIn))));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Confirm Changes"),
      content: const Text("Save Profile?"),
      actions: [
        cancelButton,
        confirmButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
