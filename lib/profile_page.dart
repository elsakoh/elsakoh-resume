import 'package:flutter/material.dart';
import 'package:portfolio/responsive_widget.dart';
import 'dart:html' as html; 

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

 List<Widget> navButtons() => [
        FlatButton(
          child: Text(
            "about" ,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
          ), 
          onPressed: () {
          },
        ),
       FlatButton(
          child: Text(
            "work",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ), 
          onPressed: () {
          },
        ),
        FlatButton(
          child: Text(
            "contact",
             style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ), 
          ), 
          onPressed: () {
          },
        ),
      ];

  @override
  Widget build (BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: Color(0xFF0a0396),

        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF2a00ff),
          actions: navButtons(),
        ),
        drawer: ResponsiveWidget.isSmallScreen(context)
        ? Drawer(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[],
          ),
        )
        :null,
        body: SingleChildScrollView(
          child: AnimatedPadding(
            duration: Duration(seconds: 1),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.1),
            child: ResponsiveWidget(
              largeScreen: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  NavHeader(navButtons: navButtons()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ProfileInfo(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2, 
                  ),
                  SocialInfo(),
                ],
              ),
              ),
            ),
            ),
      ),
     
    );
  }
  
}
class NavHeader extends StatelessWidget {
  final List<Widget> navButtons;

  const NavHeader({Key key, this.navButtons}) : super(key: key);

  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        //  Spacer(),
          if (!ResponsiveWidget.isSmallScreen(context))
            Row(
              children: navButtons,
            )
        ],
      ),
    );
  }
}
class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  const NavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      // shape: StadiumBorder(),
      color: Colors.white,
      child: Text(text),
      onPressed: onPressed,
    );
  }
}

class ProfileInfo extends StatelessWidget {
  profileImage(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.luminosity,
          color: Colors.deepOrange,
//            borderRadius: BorderRadius.circular(40),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("/images/elsa.jpg"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "My name is",
        textScaleFactor: 2,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      Text(
        "Elsa\nKoh",
        textScaleFactor: 5,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "I'm an aspiring software engineer",
        softWrap: true,
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          ),
        
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: StadiumBorder(),
            child: Text("Resume",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            color:  Color(0xFF2a00ff),
            onPressed: () {
            },
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            width: 20,
          ),
          RaisedButton(
            
            shape: StadiumBorder(),
            child: Text("Email",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            color:  Color(0xFF2a00ff),
            onPressed: () {
              html.window.open("mailto:kohe@u.nus.edu", "elsa");
            },
            padding: EdgeInsets.all(10),
          )
        ],
      )
    ],
  );

 @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[profileImage(context), profileData],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          profileImage(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          profileData
        ],
      ),
    );
  }
}

class SocialInfo extends StatelessWidget {
  List<Widget> socialMediaWidgets() {
    return [
      NavButton(
        text: "Github",
        onPressed: () {
          html.window.open("https://github.com/elsakoh", "Git");
        },
        color: Colors.blue,
      ),
      NavButton(
        text: "Linkedin",
        onPressed: () {
          html.window.open("https://Linkedin.com/in/elsakoh", "LinkedIn");
        },
        color: Colors.blue,
      ),
      NavButton(
        text: "Facebook",
        onPressed: () {
          // html.window.open("https://facebook.com/thepawankumaar", "Fb");
        },
        color: Colors.blue,
      ),
    ];
  }

  Widget copyRightText() => Text(
        "Elsa Koh 2020",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: socialMediaWidgets(),
          ),
          copyRightText(),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ...socialMediaWidgets(),
          copyRightText(),
        ],
      ),
    );
  }
}
