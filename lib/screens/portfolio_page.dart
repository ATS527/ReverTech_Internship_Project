import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/shape/gf_icon_button_shape.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_project/constants/text_styles.dart';
import 'package:internship_project/screens/todo_list_page/todo_list_page.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Portfolio Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TodoListPage(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      backgroundColor: Colors.green[300],
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: mediaQuery.size.height * 0.01,
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 8.0,
                      color: Colors.teal,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 16.0,
                      ),
                    ]),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/myPhoto.jpg"),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  child: Card(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "About Me!",
                              style: GoogleFonts.comfortaa(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 6.0,
                          ),
                          SizedBox(
                            height: mediaQuery.size.height * 0.03,
                          ),
                          Text(
                            "✔ Name : Anu Thampi A S",
                            style: kPortfolioTextStyle,
                          ),
                          SizedBox(
                            height: mediaQuery.size.height * 0.03,
                          ),
                          Text(
                            "✔ Branch & Year : CSE 2nd Year",
                            style: kPortfolioTextStyle,
                          ),
                          SizedBox(
                            height: mediaQuery.size.height * 0.03,
                          ),
                          FittedBox(
                            child: Text(
                              "✔ College : College Of Engineering Attingal",
                              style: kPortfolioTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: mediaQuery.size.height * 0.03,
                          ),
                          Text(
                            "✔ Age : 20",
                            style: kPortfolioTextStyle,
                          ),
                          SizedBox(
                            height: mediaQuery.size.height * 0.03,
                          ),
                          Text(
                            "✔ Place : Nedumangad,Trivandrum",
                            style: kPortfolioTextStyle,
                          ),
                          SizedBox(
                            height: mediaQuery.size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GFIconButton(
                                  icon: const Icon(FontAwesomeIcons.github),
                                  color: Colors.black54,
                                  shape: GFIconButtonShape.pills,
                                  onPressed: () async {
                                    String link = "https://github.com/ATS527";
                                    await launch(link);
                                  }),
                              const SizedBox(
                                width: 22,
                              ),
                              GFIconButton(
                                  icon: const Icon(FontAwesomeIcons.linkedin),
                                  color: Colors.blue,
                                  shape: GFIconButtonShape.pills,
                                  onPressed: () async {
                                    String link =
                                        "https://www.linkedin.com/in/anu-thampi-a-s-b158851bb";
                                    await launch(link);
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
