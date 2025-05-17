import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tichu_score/views/pages/game_page_five.dart';
import 'package:tichu_score/views/pages/game_page_thousand.dart';

class ChooseTeamName extends StatefulWidget {
  final int flag;
  const ChooseTeamName({super.key, required this.flag});

  @override
  State<ChooseTeamName> createState() => _ChooseTeamNameState();
}

class _ChooseTeamNameState extends State<ChooseTeamName> {
  final TextEditingController _name1Controller = TextEditingController();
  final TextEditingController _name2Controller = TextEditingController();
  String Team1 = "";
  String Team2 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.amber,
          child: Text(
            'Make a team!',
            style: GoogleFonts.shadowsIntoLight(
              textStyle: TextStyle(color: Colors.amber),
              fontWeight: FontWeight.w900,
              fontSize: 50,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/background.jpg', fit: BoxFit.cover),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //team 1 TEXTFIELD
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    maxLength: 10,
                    controller: _name1Controller,
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      Team1 = text;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Team 1',
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              //team 2 TEXTFIELD
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    maxLength: 10,
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      Team2 = text;
                    },
                    controller: _name2Controller,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Team 2',
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //======elevated button
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.flag == 5) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  GamePageFive(team1: Team1, team2: Team2),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  GamePageThousand(team1: Team1, team2: Team2),
                        ),
                      );
                    }
                  },
                  child: Text("Next", style: GoogleFonts.shadowsIntoLight()),
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
