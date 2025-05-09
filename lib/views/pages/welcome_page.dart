import 'package:flutter/material.dart';
import 'package:tichu_score/views/pages/choose_score.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(
            child: Title(
              color: Colors.amber,
              child: Text(
                'TICHU',
                style: GoogleFonts.shadowsIntoLight(
                  textStyle: TextStyle(color: Colors.amber),
                  fontWeight: FontWeight.w900,
                  fontSize: 50,
                ),
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
                            builder: (context) => const ChooseScore(),
                          ),
                        );
                      },
                      child: Text(
                        "START GAME",
                        style: GoogleFonts.shadowsIntoLight(),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                          left: 35,
                          right: 35,
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
      ),
    );
  }
}
