import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_application/createGig.dart';
import 'package:job_application/jobView.dart';

import 'CRUD.dart';
import 'customDrawer.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool isSearch=false;
 // GlobalKey<ScaffoldState> key1 = GlobalKey<ScaffoldState>();
TextStyle Companystyle=TextStyle(fontSize: 25,fontWeight: FontWeight.bold);
TextStyle jobTitlestyle=TextStyle(fontSize: 18,
color: Colors.blueAccent,fontWeight: FontWeight.bold);
TextStyle infoStyle=TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
color: Colors.white);





@override
  void initState() {
    // TODO: implement initState
  loggedinuser();
    super.initState();
  }


  loggedinuser() async {
    await FirebaseAuth.instance.currentUser().then((firebaseUser) {
      if (firebaseUser == null) {
        //signed out
      } else if (firebaseUser != null){
        //signed in
        CRUD.myuserid= firebaseUser.uid;
        print(firebaseUser.uid);

      }
    });
  }



  @override
  Widget build(BuildContext context) {
    print(CRUD.myuserid);
    print(CRUD.type);














    return SafeArea(
      child: StreamBuilder(

        //  stream: Firestore.instance.collection("collection").snapshots(),
       stream: Firestore.instance.collection("seller").snapshots(),
          builder: (context, snapshot) {
//            if (!snapshot.hasData) {
//
//
//              return Center(child: new CircularProgressIndicator(
//
//
//              ));
//            }



//            CRUD.name= userDocument["name"];
//            CRUD.imgUrl=userDocument['img'];

       if(snapshot.hasData){







         for(int i=0;i<snapshot.data.documents.length;i++)
           {
            if(snapshot.data.documents[i]['id']==CRUD.myuserid)
              {

                CRUD.name=snapshot.data.documents[i]['name'];
                CRUD.imgUrl=snapshot.data.documents[i]['img'];
print(snapshot.data.documents[i]['name']);
              }
           }

//         var doc=snapshot.data.documents[0];
//         print(doc['name']) ;
        /// DocumentSnapshot items = snapshot.data.documents;
             // var userdoc=snapshot.data;
//         DocumentSnapshot products =
//         snapshot.data.documents[0];

              return DefaultTabController(
                length: 3,
                child: Scaffold(

                  key: CRUD.key1,
                  drawer: CustomDrawer.buildDrawer(context),
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(100.0),
                    child: AppBar(

                      actions: <Widget>[
                        isSearch ?
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,

                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isSearch = false;
                                });
                              },
                              icon: new FaIcon(

                                FontAwesomeIcons.timesCircle,),
                            ),
                          ),
                        ) :
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,

                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isSearch = true;
                                });
                              },
                              icon: new FaIcon(

                                FontAwesomeIcons.search,),
                            ),
                          ),
                        )


                      ],


                      flexibleSpace: Container(
                        decoration: new BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [Colors.indigoAccent, Colors.deepPurple],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: IconButton(
                          onPressed: () {
                            CRUD.key1.currentState.openDrawer();
                          },
                          icon: Icon(Icons.dehaze),
                        ),
                      ),

//            appBar: PreferredSize(
//              preferredSize: Size.fromHeight(65.0),
//              child: AppBar(
//                leading: Padding(
//                  padding: const EdgeInsets.only(top: 18.0),
//                  child: IconButton(
//                    onPressed: () {
//                      key1.currentState.openDrawer();
//                    },
//                    icon: ImageIcon(
//                      AssetImage("assets/images/menu.png"),
//                      size: 30,
//                      color: Colors.white,
//                    ),
//                  ),
//                ),
//                title: Padding(
//                  padding: const EdgeInsets.only(top: 18.0),
//                  child: Text(
//                    "Read Nomi",
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontWeight: FontWeight.bold,
//                        fontSize: 22),
//                  ),
//                ),
//                centerTitle: true,
//                backgroundColor: Color(0xff0087E3),
//                actions: <Widget>[
//                  GestureDetector(
//                    onTap: () {
//                      CRUD.logOut();
//                      Navigator.pushNamed(context, '/signin');
//                    },
//                    child: Padding(
//                      padding: const EdgeInsets.only(top: 25.0),
//                      child: Text(AppLocalizations.of(context).translate('logout'),
//                          style: TextStyle(color: Colors.white, fontSize: 18)),
//                    ),
//                  ),
//                  SizedBox(
//                    width: 5,
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(right: 4.0, top: 20),
//                    child: ImageIcon(
//                      AssetImage(
//                        "assets/images/right_arrow.png",
//                      ),
//                      size: 12,
//                      color: Colors.red,
//                    ),
//                  )
//                ],
//              ),
//            ),
                      bottom: TabBar(

                        tabs: <Widget>[
                          Tab(

                            child: Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.boxes, color: Colors.white),
                                SizedBox(width: 10,),
                                Text('My Gigs ',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.briefcase,
                                    color: Colors.white),
                                SizedBox(width: 10,),
                                Text('Jobs',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),

                          Tab(
                            child: Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.checkCircle
                                    , color: Colors.white),
                                SizedBox(width: 10,),
                                Text('Completed',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),

                        ],
                      ),

                      title: !isSearch ? Text("Job Finder", style: TextStyle(
                          fontFamily: 'Spicy Rice'
                      ),

                      ) : Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextField(
                          onChanged: (value) {
                            // myfilter(value);

                          },
                          style: TextStyle(color: Colors.white, fontSize: 18),

                          decoration: InputDecoration(hintText: "Search Jobs",
                            hintStyle: TextStyle(
                                color: Colors.white
                            ),
                            icon: new Icon(Icons.search, color: Colors.white,),

                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white70),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),


                        ),
                      )

                      ,
                      centerTitle: true,

                    ),


                  ),

                  body: TabBarView(
                    children: <Widget>[


                      Stack(children: [
                        ListView(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 2),
                          physics: BouncingScrollPhysics(),
                          children: [

                            gigCard(),
                            gigCard(),
                            gigCard(),
                            gigCard()
                          ],)
                        ,
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50, right: 20),
                          child: Align(

                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton(
                              onPressed: () {



                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreateGig()),
                                );
                              },
                              tooltip: "Add New Gig",
                              elevation: 10,
                              child:

                              Icon(FontAwesomeIcons.pen),

                              backgroundColor: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ],)


                      ,


                      ListView(
                        padding: EdgeInsets.all(10),
                        physics: BouncingScrollPhysics(),
                        children: <Widget>[
                          JobCard(),
                          JobCard(),
                          JobCard(),
                          JobCard(),
                          JobCard(),

                        ],

                      ),

                      ListView(
                        physics: const BouncingScrollPhysics(),
                        children: <Widget>[
                          Card1(),
                          Card1(),
                          Card1(),

                        ],
                      ),


                    ],
                  ),
                ),
              );
            }

       else{
         return Center(child: CircularProgressIndicator());
       }



          }
      ),
    );
  }


  Widget gigCard()
  {

    return Card(
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(10.0),
        side: new BorderSide(color: Colors.black, width: 1.0),
      ),
elevation: 20,
      child: Container(

padding: EdgeInsets.all(15),
          width: double.infinity,
          child:
          Column(children: [

            Image.network("https://i.pinimg.com/originals/f8/f6/56/f8f656fd473305405d82d4a64f777a85.jpg",

            ),

            Divider(color: Colors.black,
            thickness: 1,),
//            Row(children: [
//
//              CircleAvatar(child:
//              Image.network("https://cdn2.iconfinder.com/data/icons/ui-v-1-circular-glyph/48/UI_v.1-Circular-Glyph-20-512.png"),
//                backgroundColor: Colors.white70,
//                radius: 30,
//
//              ),
//              SizedBox(width: 15,),
//              Text("Anonymous",style: TextStyle(fontWeight: FontWeight.bold,
//                  fontSize: 22
//              ))
//
//            ],),
SizedBox(height: 10,),
            Text("I will Create Wordpress website for u",style: TextStyle(
                fontSize: 20
            )),

          SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerRight,
              child: Text("\$50 dollars",style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontSize: 20
              )),
            ),
          ],)
      ),
    );



  }



  Widget JobCard() {
    return Container(
      //padding: EdgeInsets.only(top: 100,bottom: 100),
    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 6),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        color: Colors.white.withOpacity(0.88),
        elevation: 5,
        child: Column(
//crossAxisAlignment: CrossAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[


        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
flex: 2,
                child: Container(
                  child: Text("Flutter Developer is resquired",style: jobTitlestyle,


                  ),
                ),
              ),

              Expanded(
flex: 1,
                child: Container(
                  child: CircleAvatar(child:
                  Image.network('https://icons-for-free.com/iconfiles/png/512/Google-1320568266385361674.png'),
                  radius: 25,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              )

            ],
          ),
        ),
            SizedBox(height: 5,),
            Row(
mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
          Text("Budget ",style: TextStyle(

            color: Colors.black87

          ),


          ),

             Text(" |  "),


                Text("\$20",textAlign: TextAlign.left,)
        ],),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
Expanded(
  flex: 0,
    child: Icon(FontAwesomeIcons.userTie,color: Colors.indigoAccent,)),
            Expanded(

              child: Text("Applicants : 6",
              style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),

              ),
            ),
            Flexible(

              child: FlatButton(
                splashColor: Colors.blueAccent,
                shape:   RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
      ),
                onPressed: ()
                {




//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => JobView()),
//                  );
                },
                color: Colors.deepPurple,
                child:
              Text("view",style: infoStyle,),
              ),
            )
          ],
        )

          ],
        ),
      ),
    );
  }
}


class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 150,
                  child: Container(
                    
                    padding: EdgeInsets.all(20),
                    child:

                    Column(
                      children: <Widget>[



                        Row(
                          
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius:30,
                            child: Image.network("https://icons-for-free.com/iconfiles/png/512/Google-1320568266385361674.png"),

                          ),

                          Text("Company Review",style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25
                          ),)

                        ],),

                    RatingBar(
                      itemSize: 30,
                      initialRating: 3.5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )

                      ],
                    ),
                    decoration: new BoxDecoration(


                      gradient: new LinearGradient(
                          colors: [Colors.indigoAccent, Colors.deepPurple],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),

                    ),

                  ),

                ),
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Your Review",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        )),

                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: RatingBar(
                                unratedColor: Colors.black38.withOpacity(0.1),
                                initialRating: 2.25,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,

                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              )

                          ),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }



}