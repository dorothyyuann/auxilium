import 'package:auxilium/postviewer.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home_button.dart';
import 'navbar.dart';

class CommunityPage extends StatefulWidget {
  final GoogleSignInAccount user;
  final GoogleSignIn googleSignIn;
  const CommunityPage(this.user, this.googleSignIn, {Key key})
      : super(key: key);
  @override
  CommunityPageState createState() => CommunityPageState();
}

class CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 168, 159, 104),
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('community',
              style: TextStyle(
                  color: Color.fromARGB(255, 65, 82, 31), fontSize: 28)),
          backgroundColor: const Color.fromARGB(255, 245, 253, 198),
          leading: homeButton(context, widget.user, widget.googleSignIn)),
      bottomNavigationBar:
          buildNavBar(context, widget.user, widget.googleSignIn),
      body: postViewer(),
    );
  }

  Widget buildBottomIconButton(IconData icon, Color color) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
      ),
      onPressed: () {},
    );
  }
}
