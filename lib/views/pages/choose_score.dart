import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tichu_score/views/pages/choose_name.dart';

class ChooseScore extends StatefulWidget {
  final int
  flag; //this shows what button the user presses if flag=5 then score=500 if flag=1000 then score = 10
  const ChooseScore({super.key, required this.flag});

  @override
  State<ChooseScore> createState() => _ChooseScoreState();
}

class _ChooseScoreState extends State<ChooseScore> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Title(
          color: Colors.amber,
          child: Text(
            'CHOOSE GAME',
            style: GoogleFonts.shadowsIntoLight(
              textStyle: TextStyle(color: Colors.amber),
              fontWeight: FontWeight.w900,
              fontSize: 50,
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChooseTeamName(flag: 5),
                        ),
                      );
                    },
                    child: Text("500", style: GoogleFonts.shadowsIntoLight()),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 50,
                        right: 50,
                      ),
                      backgroundColor: Colors.amberAccent,
                      foregroundColor: Colors.red,
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChooseTeamName(flag: 10),
                        ),
                      );
                    },
                    child: Text("1000", style: GoogleFonts.shadowsIntoLight()),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 50,
                        right: 50,
                      ),
                      backgroundColor: Colors.amberAccent,
                      foregroundColor: Colors.red,
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
