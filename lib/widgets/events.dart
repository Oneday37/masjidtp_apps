import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventSection extends StatefulWidget {
  const EventSection({super.key});

  @override
  State<EventSection> createState() => _EventState();
}

class _EventState extends State<EventSection> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.event_note),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Events",
                  style: GoogleFonts.oswald(fontSize: 18),
                )
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                SizedBox(
                    height: 130,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/masjid.jpg",
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //EVENT & DESKRIPSI
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Text(
                                "Event 1",
                                style: GoogleFonts.oswald(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 5
                                          ..color = Colors.black)),
                              ),
                              Text("Event 1",
                                  style: GoogleFonts.oswald(
                                      color: Colors.white, fontSize: 18))
                            ],
                          ),
                          Stack(
                            children: [
                              Text(
                                "Deskripsi",
                                style: GoogleFonts.oswald(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 5
                                          ..color = Colors.black)),
                              ),
                              Text("Deskripsi",
                                  style: GoogleFonts.oswald(
                                      color: Colors.white, fontSize: 18))
                            ],
                          ),
                        ],
                      ),
                      // TANGGAL EVENT
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              Text(
                                "17 Dzhulhijjah 1445",
                                style: GoogleFonts.oswald(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 5
                                          ..color = Colors.black)),
                              ),
                              Text("17 Dzhulhijjah 1445",
                                  style: GoogleFonts.oswald(
                                      color: Colors.white, fontSize: 18))
                            ],
                          ),
                          Stack(
                            children: [
                              Text(
                                "25 Mei 2024",
                                style: GoogleFonts.oswald(
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 5
                                          ..color = Colors.black)),
                              ),
                              Text("25 Mei 2024",
                                  style: GoogleFonts.oswald(
                                      color: Colors.white, fontSize: 18))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Event 2"), Text("Deskripsi")],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Text("13 Dzulhijjah 1445"), Text("25 May 2024")],
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Event 3"), Text("Deskripsi")],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Text("13 Dzulhijjah 1445"), Text("25 May 2024")],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
