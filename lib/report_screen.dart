import 'package:emotion_detector/components/bottom_bar.dart';
import 'package:emotion_detector/home_screen.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Column(
              children: [
                Image.asset("assets/images/emoji.png"),
                Image.asset('assets/images/text.png', width: 300,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                  },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue),
                          padding: MaterialStateProperty.all(EdgeInsets.all(16))
                      ),
                      child: Text("Got it!", style: TextStyle(fontSize: 18, color: Colors.white),)
                  ),
                )
              ],
            ),
          ),
          Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(child: Image.asset("assets/images/heart-rate.png")),
            const SizedBox(
              height: 25,
            ),
            Center(child: Image.asset("assets/images/blood-group.png")),
            const SizedBox(
              height: 25,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 50.0),
            //   child: Row(
            //     children: [
            //       Text(
            //         "Latest Report",
            //         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            //       ),
            //     ],
            //   ),
            // ),
            // Expanded(
            //   child: ListView(
            //     children: [
            //       Padding(
            //         padding:
            //             const EdgeInsets.only(left: 40.0, right: 40, top: 0),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             // color: Colors.blueAccent,
            //             borderRadius: BorderRadius.circular(10),
            //             border: Border.all(color: Colors.grey),
            //           ),
            //           child: Padding(
            //             padding: const EdgeInsets.all(12.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Row(
            //                   children: [
            //                     Image.asset('assets/images/report.png'),
            //                     const SizedBox(
            //                       width: 10,
            //                     ),
            //                     Container(
            //                       width: 190,
            //                       child: const Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                             'General Report',
            //                             style: TextStyle(
            //                                 fontWeight: FontWeight.bold,
            //                                 fontSize: 14),
            //                           ),
            //                           const SizedBox(
            //                             height: 6,
            //                           ),
            //                           Row(
            //                             children: [
            //                               Text(
            //                                 "Jun 10, 20223 ",
            //                                 style: TextStyle(fontSize: 11),
            //                               ),
            //                             ],
            //                           )
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(bottom: 25.0),
            //                   child: Image.asset('assets/images/dots.png'),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 12,
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(left: 40.0, right: 40),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             border: Border.all(color: Colors.grey),
            //           ),
            //           child: Padding(
            //             padding: const EdgeInsets.all(12.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Row(
            //                   children: [
            //                     Image.asset('assets/images/report.png'),
            //                     const SizedBox(
            //                       width: 10,
            //                     ),
            //                     Container(
            //                       width: 190,
            //                       child: const Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                             'General Report',
            //                             style: TextStyle(
            //                                 fontWeight: FontWeight.bold,
            //                                 fontSize: 14),
            //                           ),
            //                           const SizedBox(
            //                             height: 6,
            //                           ),
            //                           Row(
            //                             children: [
            //                               Text(
            //                                 "Jun 10, 20223 ",
            //                                 style: TextStyle(fontSize: 11),
            //                               ),
            //                             ],
            //                           )
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(bottom: 25.0),
            //                   child: Image.asset('assets/images/dots.png'),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 12,
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),]
      ),
      // bottomNavigationBar: BottomBar(
      //   currentIndex: 1,
      // ),
    );
  }
}
