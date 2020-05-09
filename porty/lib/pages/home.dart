import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:porty/components/mouse_cursor.dart';
import 'package:porty/components/responsive_widget.dart';
import 'package:porty/util/constants.dart';
import 'dart:html' as html;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final portfolioKey = new GlobalKey();
  final skillKey = new GlobalKey();
  final aboutKey = new GlobalKey();
  List menu = [
    {
      'title': 'About me',
      'section': '',
    },
    {
      'title': 'Portfolio',
      'section': '',
    },
    {
      'title': 'My Skills',
      'section': '',
    },
  ];

  List images = List.generate(5, (index) => "assets/images/${index+1}.png");

  screenWidth()=>MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        largeScreen: ListView(
          children: <Widget>[
            _buildLargeTopSection(),
            _buildLargeAboutMeSection(),
            SizedBox(height: 50.0,),
            _buildLargePortfolioSection(),
            _buildLargeSkillsSection(),
            SizedBox(height: 50.0,),
            _buildFooter(),
            SizedBox(height: 50.0,),
          ],
        ),
        smallScreen: ListView(
          children: <Widget>[
            _buildSmallTopSection(),
            _buildSmallAboutMeSection(),
            SizedBox(height: 50.0,),
            _buildSmallPortfolioSection(),
            _buildSmallSkillsSection(),
            SizedBox(height: 50.0,),
            _buildFooter(),
            SizedBox(height: 50.0,),
          ],
        ),
      ),
    );
  }

  _buildLargeTopSection(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${Constants.name}.',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                Row(
                  children: <Widget>[
                    for(int i = 0; i<menu.length; i++)
                      _buildMenuText(menu[i]['title'])
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0,),

          _buildDivider(),
        ],
      ),
    );
  }

  _buildSmallTopSection(){
    return Column(
      children: <Widget>[
        AppBar(
          elevation: 0.0,
          title: Text(
            '${Constants.name}.',
            style: TextStyle(
              fontSize: 24.0,
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: _buildDivider(),
        ),
      ],
    );
  }

  _buildDivider(){
    return Container(
      color: Theme.of(context).textTheme.caption.color.withOpacity(0.4),
      width: MediaQuery.of(context).size.width,
      height: .2,
    );
  }

  _buildMenuText(String text){
    return Padding(
      padding: EdgeInsets.only(right: 50.0),
      child: MouseCursor(
        child: GestureDetector(
          onTap: (){
            if(text == "Portfolio"){
              Scrollable.ensureVisible(portfolioKey.currentContext);
            }else if(text == 'My Skills'){
              Scrollable.ensureVisible(skillKey.currentContext);
            }else{
              Scrollable.ensureVisible(aboutKey.currentContext);
            }
          },
          child: Text(
            '$text',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  _buildLargeAboutMeSection(){
    return Padding(
      padding: EdgeInsets.only(left: 130, right: 100),
      child: Column(
        key: aboutKey,
        children: <Widget>[
          SizedBox(height: 50.0,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildAboutMe(),
              SizedBox(width: 30.0,),
              _buildProfilePicture(),
            ],
          ),
        ],
      ),
    );
  }

  _buildSmallAboutMeSection(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30.0,),
          _buildSmallAboutMe(),
          SizedBox(width: 10.0,),
          _buildSmallProfilePicture(),
        ],
      ),
    );
  }

  _buildAboutMe(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'HELLO, MY NAME IS',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10.0,),
        Text(
          'Festus Olusegun',
          style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0,),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting\n"
              "industry. Lorem Ipsum has been the industry's standard "
              "dummy\ntext ever since the 1500s, when an unknown printer .",
          style: TextStyle(
            color: Theme.of(context).textTheme.caption.color,
            fontSize: 12.0,
          ),
        ),
        SizedBox(height: 30.0,),
        Row(
          children: <Widget>[
            Container(
              height: 40.0,
              width: 100.0,
              child: MouseCursor(
                child: FlatButton(
                  onPressed: ()=>html.window.open(
                    "https://github.com/JideGuru",
                    "JideGuru Github",
                  ),
                  color: Theme.of(context).accentColor,
                  child: Text(
                    'My work'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(width: 20.0,),

            Container(
              height: 40.0,
              width: 100.0,
              child: MouseCursor(
                child: OutlineButton(
                  color: Colors.transparent,
                  onPressed: ()=>html.window.open(
                    Constants.hireMe,
                    "Hire me",
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 1,
                  ),
                  child: Text(
                    'Hire me'.toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  _buildSmallAboutMe(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'HELLO, MY NAME IS',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
            fontWeight: FontWeight.w600,
          ),
        ),
//        SizedBox(height: 10.0,),
        Text(
          'Festus Olusegun',
          style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
//        SizedBox(height: 10.0,),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting\n"
              "industry. Lorem Ipsum has been the industry's standard "
              "dummy\ntext ever since the 1500s, when an unknown printer .",
          style: TextStyle(
            color: Theme.of(context).textTheme.caption.color,
            fontSize: 10.0,
          ),
        ),
        SizedBox(height: 20.0,),
        Row(
          children: <Widget>[
            Container(
              height: 40.0,
              width: 100.0,
              child: MouseCursor(
                child: FlatButton(
                  onPressed: ()=>html.window.open(
                    "https://github.com/JideGuru",
                    "JideGuru Github",
                  ),
                  color: Theme.of(context).accentColor,
                  child: Text(
                    'My work'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(width: 20.0,),

            Container(
              height: 40.0,
              width: 100.0,
              child: MouseCursor(
                child: OutlineButton(
                  color: Colors.transparent,
                  onPressed: ()=>html.window.open(
                    Constants.hireMe,
                    "Hire me",
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 1,
                  ),
                  child: Text(
                    'Hire me'.toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildProfilePicture(){
    return Stack(
      children: <Widget>[
        Container(
          height: 400.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 520.0,
                height: 270.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  color: Colors.grey[100],
                ),
              ),
            ],
          ),
        ),

        Positioned(
          left: 40.0,
          bottom: 40.0,
          child: Container(
            width: 250.0,
            height: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Theme.of(context).accentColor,
            ),
            child: Image.asset(
              "assets/images/person.png",
            ),
          ),
        ),

        Positioned(
          right: 40.0,
          bottom: 50.0,
          child: Container(
            height: 150.0,
            width: 150.0,
            child: GridView.builder(
              itemCount: Constants.social.length,
              itemBuilder: (BuildContext context, int index) {
                Map socialItem = Constants.social[index];
                return MouseCursor(
                  child: IconButton(
                    onPressed: ()=>html.window.open(
                      socialItem['link'],
                      "${socialItem['link']}",
                    ),
                    icon: Icon(
                      socialItem['icon'],
                      size: 45.0,
                      color: Color(0xff414141),
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildSmallProfilePicture(){
    return Stack(
      children: <Widget>[
        Container(
          height: 250.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 400.0,
                height: 170.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: Colors.grey[100],
                ),
              ),
            ],
          ),
        ),

        Positioned(
          left: 20.0,
          bottom: 20.0,
          child: Container(
            width: 150.0,
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Theme.of(context).accentColor,
            ),
            child: Image.asset(
              "assets/images/person.png",
            ),
          ),
        ),

        Positioned(
          right: 30.0,
          bottom: 30.0,
          child: Container(
            height: 100.0,
            width: 100.0,
            child: GridView.builder(
              itemCount: Constants.social.length,
              itemBuilder: (BuildContext context, int index) {
                Map socialItem = Constants.social[index];
                return MouseCursor(
                  child: IconButton(
                    onPressed: ()=>html.window.open(
                      socialItem['link'],
                      "${socialItem['link']}",
                    ),
                    icon: Icon(
                      socialItem['icon'],
                      size: 35.0,
                      color: Color(0xff414141),
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildLargePortfolioSection(){
    return Padding(
      padding: EdgeInsets.only(left: 110.0, right: 100.0),
      child: Column(
        key: portfolioKey,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Portfolio'.toUpperCase(),
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Container(
              color: Theme.of(context).accentColor,
              width: 60.0,
              height: .5,
            ),
          ),

          SizedBox(height: 10.0,),

          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting\n"
                  "industry. Lorem Ipsum has been the industry's ",
              style: TextStyle(
                color: Theme.of(context).textTheme.caption.color,
                fontSize: 12.0,
              ),
            ),
          ),

          SizedBox(height: 30.0,),

          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: <Widget>[
              for(int i = 0; i<images.length; i++)
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: Image.asset(
                    "${images[i]}",
                    height: 250.0,
                    width: 270.0,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),

          SizedBox(height: 100.0,),
        ],
      ),
    );
  }
  _buildSmallPortfolioSection(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Portfolio'.toUpperCase(),
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
            ),
          ),

          Container(
            color: Theme.of(context).accentColor,
            width: 60.0,
            height: .5,
          ),

          SizedBox(height: 10.0,),

          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting\n"
                "industry. Lorem Ipsum has been the industry's ",
            style: TextStyle(
              color: Theme.of(context).textTheme.caption.color,
              fontSize: 10.0,
            ),
          ),

          SizedBox(height: 30.0,),

          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: <Widget>[
              for(int i = 0; i<images.length; i++)
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: Image.asset(
                    "${images[i]}",
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),

          SizedBox(height: 100.0,),
        ],
      ),
    );
  }

  _buildLargeSkillsSection(){
    return Container(
      key: skillKey,
      color: Colors.grey[100],
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 130.0, vertical: 80.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'My skills'.toUpperCase(),
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Container(
                color: Theme.of(context).accentColor,
                width: 60,
                height: .2,
              ),
            ),
            SizedBox(height: 10.0,),

            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting\n"
                    "industry. Lorem Ipsum has been the industry's ",
                style: TextStyle(
                  color: Theme.of(context).textTheme.caption.color,
                  fontSize: 12.0,
                ),
              ),
            ),

            SizedBox(height: 30.0,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  for(int i = 0; i<Constants.skills.length; i++)
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        width: 380.0,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "${Constants.skills[i]['title']}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),

                                  Text(
                                    "${Constants.skills[i]['value']} %",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10.0,),

                            LinearPercentIndicator(
                              width: 380.0,
                              lineHeight: 8.0,
                              percent: Constants.skills[i]['value']/100,
                              progressColor: Theme.of(context).accentColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSmallSkillsSection(){
    return Container(
      color: Colors.grey[100],
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'My skills'.toUpperCase(),
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
              ),
            ),

            Container(
              color: Theme.of(context).accentColor,
              width: 60,
              height: .2,
            ),
            SizedBox(height: 10.0,),

            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting\n"
                  "industry. Lorem Ipsum has been the industry's ",
              style: TextStyle(
                color: Theme.of(context).textTheme.caption.color,
                fontSize: 10.0,
              ),
            ),

            SizedBox(height: 30.0,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  for(int i = 0; i<Constants.skills.length; i++)
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "${Constants.skills[i]['title']}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),

                                  Text(
                                    "${Constants.skills[i]['value']} %",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10.0,),

                            LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width-80.0,
                              lineHeight: 8.0,
                              percent: Constants.skills[i]['value']/100,
                              progressColor: Theme.of(context).accentColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildFooter(){
    return Center(
      child: Text(
        "${Constants.name} © ${DateTime.now().year} All Rights Reserved",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 10.0,
        ),
      ),
    );
  }
}
