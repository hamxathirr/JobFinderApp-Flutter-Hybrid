import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_application/companyCreateJob.dart';
import 'package:job_application/gigList.dart';
import 'package:job_application/jobView.dart';

import 'package:job_application/customDrawer.dart';

import 'CRUD.dart';

class CWelcome extends StatefulWidget {
  @override
  _CWelcomeState createState() => _CWelcomeState();
}

class _CWelcomeState extends State<CWelcome> {
  bool isSearch=false;
 // GlobalKey<ScaffoldState> key1 = GlobalKey<ScaffoldState>();
  TextStyle Companystyle=TextStyle(fontSize: 25,fontWeight: FontWeight.bold);
  TextStyle jobTitlestyle=TextStyle(fontSize: 18,
      color: Colors.blueAccent,fontWeight: FontWeight.bold);
  TextStyle infoStyle=TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
      color: Colors.white);
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          key: CRUD.key1,
          drawer: CustomDrawer.buildDrawer(context),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(

              actions: <Widget>[
                isSearch?
                Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,

                    child: IconButton(
                      onPressed: (){
                        setState(() {

                          isSearch=false;

                        });

                      },
                      icon: new FaIcon(

                        FontAwesomeIcons.timesCircle,),
                    ),
                  ),
                ):
                Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,

                    child: IconButton(
                      onPressed: (){
                        setState(() {

                          isSearch=true;


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
                        Icon(FontAwesomeIcons.stream, color: Colors.white),
                        SizedBox(width: 10,),
                        Text('Categories ', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.briefcase, color: Colors.white),
                        SizedBox(width: 10,),
                        Text('Our Jobs', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),

              title: !isSearch? Text("Job Finder",style: TextStyle(
                  fontFamily: 'Spicy Rice'
              ),

              ):Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  onChanged:(value){
                    // myfilter(value);

                  } ,
                  style: TextStyle(color: Colors.white,fontSize: 18),

                  decoration: InputDecoration(hintText:"Search Jobs",hintStyle:TextStyle(
                      color: Colors.white
                  ),
                    icon: new Icon(Icons.search,color: Colors.white,),

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),



                ),
              )

              ,centerTitle: true,

            ),


          ),

          body: TabBarView(
            children: <Widget>[
              GridView.count(
                physics: BouncingScrollPhysics(),
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 15,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: <Widget>[

                  categoryCard("Programming",Icon(FontAwesomeIcons.code,color: Colors.black,size: 42,)),
                  categoryCard("Digital Marketing",Icon(FontAwesomeIcons.bullhorn,color: Colors.black,size: 42,)),
                  categoryCard("Buisness",Icon(FontAwesomeIcons.businessTime,color: Colors.black,size: 42,)),
                  categoryCard("Writing and Translation",Icon(FontAwesomeIcons.penAlt,color: Colors.black,size: 42,)),
                  categoryCard("Lifestyle",Icon(FontAwesomeIcons.leaf,color: Colors.black,size: 42,)),
                  categoryCard("Graphics and designs",Icon(FontAwesomeIcons.paintBrush,color: Colors.black,size: 42,)),


                ],
              ),

              Stack(children: <Widget>[






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

                Padding(
                  padding: const EdgeInsets.only(bottom: 50,right: 20),
                  child: Align(

                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreateJob()),
                        );
                      },
tooltip: "Add New Proposal",
elevation: 10,
                      child:

                    Icon(FontAwesomeIcons.pen),

                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),


              ],)



            ],
          ),
        ),
      ),
    );
  }

   categoryCard(String name,Icon data) {

    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GigList()),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(


          side: new BorderSide(color: Colors.indigo, width: 2.0),
        ),


                    elevation: 11,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                       data,
                        SizedBox(height: 20,),
                        Text(name, textAlign:TextAlign.center,style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                          fontSize: 18,

                        )),

                      ],),
                      color: Colors.white,
                    ),
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

            Text("Google",style: Companystyle,
              textAlign: TextAlign.left,),
            SizedBox(height: 8,),
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
                Text("Type ",style: TextStyle(

                    color: Colors.black87

                ),


                ),

                Text(" |  "),


                Text("Contract",textAlign: TextAlign.left,)
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
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => JobView()),
//                      );
                    },
                    color: Colors.indigo,
                    child:
                    Text("Edit ",style: infoStyle,),
                  ),
                ),
                Flexible(

                  child:

                  Icon(FontAwesomeIcons.trash, color:
                    Colors.purple
                    ,)
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
