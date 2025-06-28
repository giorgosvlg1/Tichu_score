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
  int team1Score = 0;
  int team2Score = 0;

  int lastTeam1 = 0;
  int lastTeam2 = 0;

  void _showScoreInputDialog() {
    int team1Input = 0;
    int team2Input = 0;

    bool tichu1 = false,
        grandTichu1 = false,
        failTichu1 = false,
        failGrand1 = false;
    bool tichu2 = false,
        grandTichu2 = false,
        failTichu2 = false,
        failGrand2 = false;
    bool oneTwoTeam1 = false, oneTwoTeam2 = false;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Enter round points",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(height: 12),
                      _buildTeamSection(
                        label: widget.team1,
                        onPointsChanged: (val) => team1Input = val,
                        tichu: tichu1,
                        grandTichu: grandTichu1,
                        failTichu: failTichu1,
                        failGrandTichu: failGrand1,
                        oneTwo: oneTwoTeam1,
                        onChanged:
                            (field, value) => setDialogState(() {
                              switch (field) {
                                case 'tichu':
                                  tichu1 = value;
                                  break;
                                case 'grand':
                                  grandTichu1 = value;
                                  break;
                                case 'failTichu':
                                  failTichu1 = value;
                                  break;
                                case 'failGrand':
                                  failGrand1 = value;
                                  break;
                                case 'oneTwo':
                                  oneTwoTeam1 = value;
                                  if (value) oneTwoTeam2 = false;
                                  break;
                              }
                            }),
                      ),
                      const Divider(color: Colors.white30),
                      _buildTeamSection(
                        label: widget.team2,
                        onPointsChanged: (val) => team2Input = val,
                        tichu: tichu2,
                        grandTichu: grandTichu2,
                        failTichu: failTichu2,
                        failGrandTichu: failGrand2,
                        oneTwo: oneTwoTeam2,
                        onChanged:
                            (field, value) => setDialogState(() {
                              switch (field) {
                                case 'tichu':
                                  tichu2 = value;
                                  break;
                                case 'grand':
                                  grandTichu2 = value;
                                  break;
                                case 'failTichu':
                                  failTichu2 = value;
                                  break;
                                case 'failGrand':
                                  failGrand2 = value;
                                  break;
                                case 'oneTwo':
                                  oneTwoTeam2 = value;
                                  if (value) oneTwoTeam1 = false;
                                  break;
                              }
                            }),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          if (team1Input < -25 ||
                              team1Input > 125 ||
                              team2Input < -25 ||
                              team2Input > 125) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Points must be between -25 and 125",
                                ),
                              ),
                            );
                            return;
                          }

                          setState(() {
                            lastTeam1 = team1Score;
                            lastTeam2 = team2Score;

                            if (oneTwoTeam1) {
                              team1Score += 200 - 100;
                              team1Input += 100;
                            }
                            if (oneTwoTeam2) {
                              team2Score += 200 - 100;
                              team2Input += 100;
                            }

                            if (team2Input == 0) {
                              team2Input = 100 - team1Input;
                              team1Score +=
                                  100 -
                                  team2Input +
                                  (tichu1 ? 100 : 0) +
                                  (grandTichu1 ? 200 : 0) -
                                  (failTichu1 ? 100 : 0) -
                                  (failGrand1 ? 200 : 0);
                            } else {
                              team1Score +=
                                  100 -
                                  team2Input +
                                  (tichu1 ? 100 : 0) +
                                  (grandTichu1 ? 200 : 0) -
                                  (failTichu1 ? 100 : 0) -
                                  (failGrand1 ? 200 : 0);
                            }

                            if (team1Input == 0) {
                              team1Input = 100 - team2Input;
                              team2Score +=
                                  100 -
                                  team1Input +
                                  (tichu2 ? 100 : 0) +
                                  (grandTichu2 ? 200 : 0) -
                                  (failTichu2 ? 100 : 0) -
                                  (failGrand2 ? 200 : 0);
                            } else {
                              team2Score +=
                                  100 -
                                  team1Input +
                                  (tichu2 ? 100 : 0) +
                                  (grandTichu2 ? 200 : 0) -
                                  (failTichu2 ? 100 : 0) -
                                  (failGrand2 ? 200 : 0);
                            }
                          });

                          Navigator.pop(context);
                          _checkWinner();
                        },
                        child: const Text("Submit"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTeamSection({
    required String label,
    required Function(int) onPointsChanged,
    required bool tichu,
    required bool grandTichu,
    required bool failTichu,
    required bool failGrandTichu,
    required bool oneTwo,
    required Function(String, bool) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) => onPointsChanged(int.tryParse(value) ?? 0),
          decoration: InputDecoration(
            hintText: "Points",
            hintStyle: const TextStyle(color: Colors.white54),
            filled: true,
            fillColor: Colors.white10,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 4),
        _checkbox("Tichu", tichu, (val) => onChanged("tichu", val)),
        _checkbox("Grand Tichu", grandTichu, (val) => onChanged("grand", val)),
        _checkbox(
          "Fail Tichu",
          failTichu,
          (val) => onChanged("failTichu", val),
        ),
        _checkbox(
          "Fail Grand Tichu",
          failGrandTichu,
          (val) => onChanged("failGrand", val),
        ),
        _checkbox("1-2 Bonus", oneTwo, (val) => onChanged("oneTwo", val)),
      ],
    );
  }

  Widget _checkbox(String title, bool value, Function(bool) onChanged) {
    return CheckboxListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      value: value,
      onChanged: (val) => onChanged(val ?? false),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.amber,
      checkColor: Colors.black,
    );
  }

  void _checkWinner() {
    if (team1Score >= 1000 || team2Score >= 1000) {
      String winner = team1Score >= 1000 ? widget.team1 : widget.team2;
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text("Winner!"),
              content: Text("$winner won the game!"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      team1Score = 0;
                      team2Score = 0;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Restart"),
                ),
              ],
            ),
      );
    }
  }

  Text styledScore(int score) {
    return Text(
      '$score points',
      style: GoogleFonts.shadowsIntoLight(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  //Main UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Game to 1000!',
          style: GoogleFonts.shadowsIntoLight(
            textStyle: const TextStyle(color: Colors.amber),
            fontWeight: FontWeight.w900,
            fontSize: 50,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                team1Score = lastTeam1;
                team2Score = lastTeam2;
              });
            },
            icon: const Icon(Icons.undo, color: Colors.white),
            tooltip: "Undo last round",
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/background.jpg', fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.only(top: 120, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.team1,
                      style: GoogleFonts.shadowsIntoLight(
                        fontSize: 40,
                        color: Colors.amber,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    styledScore(team1Score),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.team2,
                      style: GoogleFonts.shadowsIntoLight(
                        fontSize: 40,
                        color: Colors.amber,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    styledScore(team2Score),
                    const SizedBox(height: 550),
                    IconButton(
                      onPressed: _showScoreInputDialog,
                      icon: const Icon(Icons.add, color: Colors.blueGrey),
                      iconSize: 50,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Text(
                        "Note: you can only type the points of 1 team \n and the app will automatically calculate the other",
                        style: TextStyle(color: Colors.white.withOpacity(0.4)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
