import 'package:flutter/material.dart';
import 'package:portfolio_app/profiles/profile_1/model.dart';
import 'package:portfolio_app/profiles/profile_1/provider.dart';
class Profile3 extends StatefulWidget {
  @override
  _Profile3State createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {

  Profile profile= ProfileProvider.getProfile();
  bool visible = false;
  bool visible2 = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 200),(){
      setState(() {
        visible=true;
      });
    });
    Future.delayed(Duration(milliseconds: 400),(){
      setState(() {
        visible2=true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image(
            image: ExactAssetImage("assets/profiles/profile3.jpg"),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                icon: IconButton(
                    icon: Icon(Icons.arrow_back,color: Colors.white,),
                    onPressed: (){})
              ),
              actions: [
                IconButton(icon: Icon(Icons.more_vert), onPressed: (){},color: Colors.white,)
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Stack(
              children: [
               _bodycontent(),
                _profileimage(),
              ],
            ),
              ),
        ],
    );
  }

 Widget _bodycontent() {
    return  Positioned(
      top: MediaQuery.of(context).size.height*0.1, right: MediaQuery.of(context).size.width*0.06, left: MediaQuery.of(context).size.width*0.06, bottom: MediaQuery.of(context).size.width*0.05,
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(MediaQuery.of(context).size.width*0.05),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 75,left: 5,right: 5),
                    child: Text(profile.user.name,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight:FontWeight.w900 ),textAlign:TextAlign.center,),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    child: Text(profile.user.address,textAlign:TextAlign.center,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _followButton(),
                ),
                _divider(),
                _counters(),
                _divider(),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'PHOTOS (${profile.photos.toString()})',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(10, (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: ExactAssetImage("assets/profiles/flutter.jpg"),fit: BoxFit.cover),
                        ),
                      ),
                    )),
                  ),
                ),
                ... _about()

          ],
        ),
        ),
      );
  }
  Widget _profileimage() {
    double fianlPosition=MediaQuery.of(context).size.height*0.1 - 50;
    double startPosition=0;
    return AnimatedPositioned(
      duration: Duration(seconds: 1),
      top:  visible? fianlPosition : startPosition,
      left:  MediaQuery.of(context).size.width*0.5 - 50 ,
      child: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: visible?  1 : 0,
        child: Container(
          width: 100,
          height: 100,
          child: CircleAvatar(
            backgroundImage: ExactAssetImage("assets/shared/amine.jpg"),
          ),
        ),
      ),
    );
  }

 Widget _followButton() {
    return Align(
      child: MaterialButton(
        color: Colors.deepOrange,
          onPressed: (){},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: AnimatedPadding(
              duration: Duration(milliseconds: 1000),
              padding: EdgeInsets.symmetric(horizontal: visible?15 :2, vertical: 15),
              child: Text("FOLLOW",style: TextStyle(color: Colors.white),)),

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
  List<Widget> _about() {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("ABOUT ME",style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1.2),),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(profile.user.about,style: TextStyle(fontSize: 15,),),
      ),
    ];
  }
}
