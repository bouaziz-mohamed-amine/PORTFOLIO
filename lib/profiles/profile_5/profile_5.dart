import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/profiles/profile_1/model.dart';
import 'package:portfolio_app/profiles/profile_1/provider.dart';

class Profile5 extends StatefulWidget {
  @override
  _Profile5State createState() => _Profile5State();
}

class _Profile5State extends State<Profile5> with SingleTickerProviderStateMixin {

  Profile _profile= ProfileProvider.getProfile();
  TabController _tabcontroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _tabcontroller= TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){},color: Colors.grey.shade700,),
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: (){},color: Colors.grey.shade700),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){},color: Colors.grey.shade700),
        ],
      ),
      body: contentPage(),
    );
  }

 Widget contentPage() {
    return Container(
      width: double.infinity,
      //height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _profileDetails(),
          Flexible(
            child: _tabBarContent(),
          ),
          

        ],
      ),
    );
 }
  _profileDetails() {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Container(
             width: 100,
             height: 100,
             decoration: BoxDecoration(
               image: DecorationImage(fit: BoxFit.cover,
                 image: ExactAssetImage("assets/shared/amine.jpg"),
               ),
               shape: BoxShape.circle
             ),
           ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(_profile.user.name,style: TextStyle(color: Colors.grey.shade600,fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(_profile.user.address,style: TextStyle(color: Colors.grey.shade500,fontSize: 15,fontWeight: FontWeight.bold)),
          ),
          MaterialButton(
            color: Colors.deepOrange,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25),topRight: Radius.circular(25) )),
            onPressed: (){},
            child: Text("FOLLOW",style: TextStyle(color: Colors.white),),
              ),
        ],
      ),
    );
  }

  _tabBarContent() {
     return Padding(
       padding: const EdgeInsets.all(5.0),
       child: Column(
         children: [
           TabBar(
             indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
             indicatorWeight: 3,
               unselectedLabelColor: Colors.grey.shade700,
               labelColor: Colors.grey,
               indicatorColor: Colors.grey,
               controller: _tabcontroller,
               tabs: [
                 Tab(text: 'PHOTOS'),
                 Tab(text: 'VIDEOS',),
                 Tab(text: 'POSTS',),
                 Tab(text: 'FRIENDS',),
               ],
           ),
           Flexible(
             child: TabBarView(
                 controller: _tabcontroller,
                 children: [
                   _photos(context),
                   _videos(context),
                   _posts(context),
                   _friends(context),
                 ]),
           ),
         ],
       ),
     );
  }

Widget  _photos(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      child: GridView.count(
          crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,

        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
        ],
      ),
    );
}

Widget  _videos(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 10,

        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
        ],
      ),
    );
}

 Widget _posts(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 10,

        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: ExactAssetImage("assets/profiles/profile4.jpg"),
                )
            ),
          ),
        ],
      ),
    );
 }

 Widget _friends(BuildContext context) {
   return Container(
     padding: EdgeInsets.all(1),
     child: GridView.count(
       crossAxisCount: 3,
       mainAxisSpacing: 15,
       crossAxisSpacing: 10,

       children: [
         Container(
           decoration: BoxDecoration(
               image: DecorationImage(fit: BoxFit.cover,
                 image: ExactAssetImage("assets/profiles/profile4.jpg"),
               )
           ),
         ),
         Container(
           decoration: BoxDecoration(
               image: DecorationImage(fit: BoxFit.cover,
                 image: ExactAssetImage("assets/profiles/profile4.jpg"),
               )
           ),
         ),
         Container(
           decoration: BoxDecoration(
               image: DecorationImage(fit: BoxFit.cover,
                 image: ExactAssetImage("assets/profiles/profile4.jpg"),
               )
           ),
         ),
         Container(
           decoration: BoxDecoration(
               image: DecorationImage(fit: BoxFit.cover,
                 image: ExactAssetImage("assets/profiles/profile4.jpg"),
               )
           ),
         ),
         Container(
           decoration: BoxDecoration(
               image: DecorationImage(fit: BoxFit.cover,
                 image: ExactAssetImage("assets/profiles/profile4.jpg"),
               )
           ),
         ),
         Container(
           decoration: BoxDecoration(
               image: DecorationImage(fit: BoxFit.cover,
                 image: ExactAssetImage("assets/profiles/profile4.jpg"),
               )
           ),
         ),
       ],
     ),
   );
 }
}
