import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'provider.dart';
class Profile1 extends StatefulWidget {
  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  Profile profile=ProfileProvider.getProfile();
  Color textColor =Color(0xFF4e4e4e);
  bool _visible= false;
  bool _position=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds:200),(){
      setState(() {
        _visible=true;
        _position=true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Theme(
      data: ThemeData(
        fontFamily: "SFDisplay",
      ),
      child:  Stack(
        children: [
          Image.asset(
              "assets/profiles/flutter.jpg",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.40,
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text("PROFILE",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: (){},
                    iconSize: 40,
                  )
                  ],
                leading: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: (){},
                    iconSize: 40,
                    ),
                    ),
                  body: Stack(
                    children: [
                      CustomPaint(
                        painter: ProfilePainter(),
                        child: Container(),
                      ),
                      AnimatedPositioned(
                        duration: Duration(seconds: 1),
                        left: MediaQuery.of(context).size.width*0.05,
                        top: _position ? MediaQuery.of(context).size.height*0.15: 0,
                        child: AnimatedOpacity(
                          duration:  Duration(seconds:1),
                          opacity: _visible? 1 :0,
                          child: CircleAvatar(
                            minRadius: 45,
                            backgroundImage: ExactAssetImage("assets/shared/amine.jpg",),
                          ),
                        ),
                      ),
                      _bodyText(),
                      _bottomBar(),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Widget _bottomBar() {
    return Positioned(
      bottom: MediaQuery.of(context).size.height*0.05,
      left: MediaQuery.of(context).size.width*0.05,
      right:  MediaQuery.of(context).size.width*0.05,
      child: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: _visible? 1:0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("FOLLOWERS",style: TextStyle(color: Colors.grey.shade400),),
                Text(profile.followers.toString()),
              ],
            ),
            Column(
              children: [
                Text("FOLLOWING",style: TextStyle(color: Colors.grey.shade400),),
                Text(profile.following.toString()),
              ],
            ),
            Column(
              children: [
                Text("FRIENDS",style: TextStyle(color: Colors.grey.shade400),),
                Text(profile.friends.toString()),
              ],
            ),
          ],
        ),
      ),) ;
  }

Widget  _bodyText() {
    return Positioned(
      top: MediaQuery.of(context).size.height*0.30,
      bottom: 0,
      right: MediaQuery.of(context).size.width*0.05,
      left: MediaQuery.of(context).size.width*0.05,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(profile.user.name,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),),
          ),
          Row(
            children: [
              Icon(Icons.location_on,color: Colors.grey.shade400,),
              Text(
                profile.user.address,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5 ,bottom: 8),
            child: Text(
              "ABOUT ME",
              style: TextStyle(
                color: Colors.grey.shade400
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                profile.user.about,
                softWrap: true,
                style:TextStyle(
                  color: textColor,
                  fontSize: 18,
                ) ,
              )
          ),
        ],
      ),
    );
}
}


class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    paint.color = Colors.white;
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
