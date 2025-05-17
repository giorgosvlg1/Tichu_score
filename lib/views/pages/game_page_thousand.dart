import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GamePageThousand extends StatefulWidget {
  final String team1;
  final String team2;
  const GamePageThousand({super.key, required this.team1, required this.team2});

  @override
  State<GamePageThousand> createState() => _GamePageThousandState();
}

class _GamePageThousandState extends State<GamePageThousand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.amber,
          child: Text(
            'Game to 1000!',
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
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.team1,
                  style: GoogleFonts.shadowsIntoLight(
                    fontSize: 40,
                    color: Colors.amber,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 5,
            child: VerticalDivider(
              endIndent: 200,
              thickness: 3,
              indent: 130,
              color: Colors.blueGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.team2,
                  style: GoogleFonts.shadowsIntoLight(
                    fontSize: 40,
                    color: Colors.amber,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
