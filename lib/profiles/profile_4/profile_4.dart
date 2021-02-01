import 'package:flutter/material.dart';
import 'package:portfolio_app/profiles/profile_1/model.dart';
import 'package:portfolio_app/profiles/profile_1/provider.dart';
class Profile4 extends StatefulWidget {
  @override
  _Profile4State createState() => _Profile4State();
}

class _Profile4State extends State<Profile4> {
  bool visible = false;
  Profile profile= ProfileProvider.getProfile();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 300),(){
      setState(() {
        visible=true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
    children: [
      Image.asset("assets/profiles/profile4.jpg",fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(elevation: 0,backgroundColor: Colors.transparent,leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){}),actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: (){})],),
        body: _bodycontent()),
    ],
    );
  }

Widget  _bodycontent() {
    return AnimatedOpacity(
      opacity: visible? 1:0,
      duration: Duration(seconds: 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _imageprofile(),
                ..._textprofile(),
                Column(
                  children: [
                    _divider(),
                    _counters(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
}

Widget  _imageprofile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
             CircleAvatar(
              backgroundImage: ExactAssetImage("assets/shared/amine.jpg"),maxRadius: 40,
            ),
          Row(
              children: [
                MaterialButton(
                  onPressed: (){},
                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(20)) ,
                  child: Text("ADD FRIENDS",style: TextStyle(color: Colors.grey.shade700),),
                ),
                SizedBox(width: 5,),
                MaterialButton(
                  color: Colors.grey.shade700,
                  onPressed: (){},
                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey.shade700),borderRadius: BorderRadius.circular(20)) ,
                  child: Text("FOLLOWERS",style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
        ],
      ),
    );
}

  Widget _counters() {
    return Padding(
      padding: const EdgeInsets.only(top: 15,right: 15,left: 15,bottom: 15),
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
    );
  }
  Widget _divider() {
    return Container(height: 1,color: Colors.grey.shade300);
  }

 List <Widget> _textprofile() {

    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(profile.user.name,style: TextStyle(color: Colors.grey.shade700,fontSize: 24,fontWeight:FontWeight.w900 )),
      ),
      Padding(
       padding: const EdgeInsets.all(8.0),
        child: Text(profile.user.address,style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight:FontWeight.w900 )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(profile.user.about.substring(0,150),style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1.2),),
      ),
    ];
 }
}
