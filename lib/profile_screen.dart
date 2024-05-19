import 'package:emotion_detector/components/bottom_bar.dart';
import 'package:emotion_detector/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'main.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'dart:async'; // Import async library


class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
{
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  bool happyDetected = false; // Add a variable to track if '0 Happy' is detected
  Timer? timer; // Declare a Timer variable
  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();

  }
  @override
  void dispose() {
    timer?.cancel(); // Dispose the timer
    super.dispose();
  }
  loadCamera() {
    cameraController = CameraController(cameras![1], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
        bytesList: cameraImage!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 3,
        threshold: 0.1,
        asynch: true,
      );

      predictions!.forEach((element) {
        setState(() {
          output = element['label'];
          if (output == '0 Happy' && !happyDetected) {
            happyDetected = true; // Set the flag to true
            timer = Timer(Duration(seconds: 10), () {
              setState(() {
                happyDetected = false; // Reset the flag after 10 seconds
              });
            });
          }
        });
      });
    }
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt");
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body:
      Stack(
        children: [
          if(happyDetected)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Column(
              children: [
                Image.asset("assets/images/emoji.png"),
                Image.asset('assets/images/text.png', width: 300,),
                Container(
                  width: 350,
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
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 40, right: 40),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/profile-1.png"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("Reem", style: TextStyle(fontWeight: FontWeight.w500),),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: !cameraController!.value.isInitialized
                              ? Container()
                              : AspectRatio(
                            aspectRatio: cameraController!.value.aspectRatio,
                            child: CameraPreview(cameraController!),
                          ),
                        ),
                        Text(output, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset("assets/images/vitals.png"),
            ),
            if (!happyDetected)
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40, top: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.withOpacity(0.5)), // Only bottom border
                        ),
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                          [
                            Row(
                              children: [
                                Image.asset('assets/images/heart.png'),
                                const SizedBox(width: 10,),
                                Container(
                                  width: 190,
                                  child:
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('My Saved', style:
                                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),

                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Image.asset('assets/images/right-arrow.png'),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40, top: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.withOpacity(0.5)), // Only bottom border
                        ),
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                          [
                            Row(
                              children: [
                                Image.asset('assets/images/appointments.png'),
                                const SizedBox(width: 10,),
                                Container(
                                  width: 190,
                                  child:
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('My Appointments', style:
                                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),

                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Image.asset('assets/images/right-arrow.png'),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40, top: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.withOpacity(0.5)), // Only bottom border
                        ),
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                          [
                            Row(
                              children: [
                                Image.asset('assets/images/payment.png'),
                                const SizedBox(width: 10,),
                                Container(
                                  width: 190,
                                  child:
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Payment Method', style:
                                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),

                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Image.asset('assets/images/right-arrow.png'),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40, top: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.withOpacity(0.5)), // Only bottom border
                        ),
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                          [
                            Row(
                              children: [
                                Image.asset('assets/images/faq.png'),
                                const SizedBox(width: 10,),
                                Container(
                                  width: 190,
                                  child:
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('FAQs', style:
                                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),

                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Image.asset('assets/images/right-arrow.png'),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40, top: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.withOpacity(0.5)), // Only bottom border
                        ),
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                          [
                            Row(
                              children: [
                                Image.asset('assets/images/logout.png'),
                                const SizedBox(width: 10,),
                                Container(
                                  width: 190,
                                  child:
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Logout', style:
                                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),

                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Image.asset('assets/images/right-arrow.png'),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
        ]
      ),
      bottomNavigationBar: !happyDetected
          ? BottomBar(currentIndex: 3) // Show bottom bar if the condition is met
          : null, // Otherwise, don't show the bottom bar
    );
  }

}