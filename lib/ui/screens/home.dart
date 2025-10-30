import 'package:flutter/material.dart';
import '../themes/bloopaExtras.dart';
import '../widgets/form/IntelligentSearchWidget.dart';
import '../widgets/list/LastSearchWidget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBloopaPrimaryContainer,
      // appBar: AppBarLayout(scaffoldKey: _scaffoldKey,),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Center(
          // Centrer le bouton sur l'écran
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/brand/bloopa.png", width: 450),
              const SizedBox(height: 10),
              Text(
                "Chaque objet mérite une nouvelle histoire.",
                style: TextStyle(
                  height: 1.1,
                  color: kBloopaPrimary,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top:10, bottom:10),
                child:IntelligentSearchWidget(widthSearch:600),
              ),
              ListLastSearchWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
