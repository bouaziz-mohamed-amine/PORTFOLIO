import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/profiles/profile_1/model.dart';
import 'package:portfolio_app/profiles/profile_1/provider.dart';

class Profile2 extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  @override
  Profile profile= ProfileProvider.getProfile();
  Color textColor =Color(0xFF4e4e4e);
  Widget build(BuildContext context) {
    return Stack(
      children: [
          Image.asset(
            "assets/profiles/profile_2.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.45,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Icon(Icons.menu,size: 40,color: Colors.blue.shade300,),
            ),
            body: Stack(
              children: [
                _profileTitle(),
                _bodycontent(),
              ],
            ),
          ),
      ],
    );
  }

 Widget _profileTitle() {
    return Positioned(
      //top: MediaQuery.of(context).size.height*0.04,
      right: 0,
      left: 0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(width: 140,height: 140,decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2),shape: BoxShape.circle)),
                Container(width: 120,height: 120,decoration: BoxDecoration(color: Colors.grey.withOpacity(0.4),shape: BoxShape.circle)),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape:BoxShape.circle ,
                    image: DecorationImage(fit: BoxFit.cover,
                      image: ExactAssetImage("assets/shared/amine.jpg",),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(profile.user.name,style: TextStyle(color: Colors.white,fontSize: 24,fontWeight:FontWeight.w900 ),),
            ),
            Text(profile.user.address,style: TextStyle(color: Colors.white,fontSize: 18),),
          ],
        ),
    ) ;
 }

 Widget _bodycontent() {
    return Positioned(
      top: MediaQuery.of(context).size.height*0.32,
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _counters(),
            _divider(),
           ... _about(),
            _friends(),
            _contacts()
          ],
        ),
      ),
    );
 }

 Widget _counters() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
    return Container(height: 1,color: Colors.grey.shade300,);
 }

 List<Widget> _about() {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("ABOUT ME",style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1.2),),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(profile.user.about,style: TextStyle(color: textColor,fontSize: 15,),),
      ),
    ];
 }

 Widget _friends() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          "FRIENDS (${profile.friends.toString()})",
          style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1.2),
      ),
    );
 }

 Widget _contacts() {
    return Flexible(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(20, (index) => Padding(
          padding: const EdgeInsets.only(right: 9,left: 2,bottom: 5),
          child: Container(
            //width: MediaQuery.of(context).size.width*0.3,
           // height: MediaQuery.of(context).size.height*0.1,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: ExactAssetImage("assets/shared/amine.jpg"),
              ),
            ),
          ),
        )),
      ),
    );
 }
}
