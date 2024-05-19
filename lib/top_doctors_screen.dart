import 'package:emotion_detector/doctor_detail_screen.dart';
import 'package:flutter/material.dart';

class TopDoctorsScreen extends StatefulWidget {
  const TopDoctorsScreen({super.key});

  @override
  State<TopDoctorsScreen> createState() => _TopDoctorsScreenState();
}

class _TopDoctorsScreenState extends State<TopDoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Top Doctors',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 45, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/Search.png'),
                Image.asset('assets/images/settings.png')
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoctorDetailScreen(
                                  doctorName: "Dr. Fadi",
                                  image: "assets/images/doctor-1.png",
                                  profession: "Chardiologist")));
                    },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/doctor-1.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 80,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dr. Fadi',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "Chardiologist",
                                        style: TextStyle(fontSize: 8),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Image.asset("assets/images/rating.png"),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        "800m away",
                                        style: TextStyle(fontSize: 8),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorDetailScreen(
                                doctorName: "Dr. Ameera",
                                image: "assets/images/doctor-2.png",
                                profession: "Dentist")));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('assets/images/doctor-2.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 90,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dr. Ameera',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "Dentist",
                                        style: TextStyle(fontSize: 8),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Image.asset("assets/images/rating.png"),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        "800m away",
                                        style: TextStyle(fontSize: 8),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorDetailScreen(
                                doctorName: "Dr. Reem",
                                image: "assets/images/doctor-3.png",
                                profession: "Orthopaedic")));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/doctor-3.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 90,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dr. Reem',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "Orthopaedic",
                                        style: TextStyle(fontSize: 8),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Image.asset("assets/images/rating.png"),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        "800m away",
                                        style: TextStyle(fontSize: 8),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorDetailScreen(
                                doctorName: "Dr. Nihal",
                                image: "assets/images/doctor-4.png",
                                profession: "Chardeologist")));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/doctor-4.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 90,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dr. Nihal',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "Chardeologist",
                                        style: TextStyle(fontSize: 8),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Image.asset("assets/images/rating.png"),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        "800m away",
                                        style: TextStyle(fontSize: 8),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorDetailScreen(
                                doctorName: "Dr. Rasha",
                                image: "assets/images/doctor-5.png",
                                profession: "Chardeologist")));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/doctor-5.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 90,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dr. Rasha',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "Chardeologist",
                                        style: TextStyle(fontSize: 8),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Image.asset("assets/images/rating.png"),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        "800m away",
                                        style: TextStyle(fontSize: 8),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
