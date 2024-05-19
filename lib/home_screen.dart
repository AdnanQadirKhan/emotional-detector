import 'package:camera/camera.dart';
import 'package:emotion_detector/pharmacy_screen.dart';
import 'package:emotion_detector/top_doctors_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'components/bottom_bar.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  int scrollCount = 0;

  bool showcaseStarted = false;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();

    // Add listener to the scroll controller
    _scrollController.addListener(_scrollListener);
  }
  @override
  void dispose() {
    // Dispose the scroll controller when not needed
    _scrollController.dispose();
    super.dispose();
  }
  // Scroll listener function
  void _scrollListener() {
    if (_scrollController.offset > 0 && !showcaseStarted) {
      scrollCount++;
      print(scrollCount);
      if(scrollCount>=22) {
        setState(() {
          showcaseStarted = true; // Set showcaseStarted to true to prevent multiple starts
          scrollCount=0;
        });
      }
    }
  }
  //
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
          asynch: true);

      predictions!.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
    }
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt");
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(builder: (context){
        if (showcaseStarted && output == "1 Sad") {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            ShowCaseWidget.of(context)?.startShowCase([_one, _two]);
          });
          showcaseStarted = false;
        }
      return Scaffold(
        body: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: HexColor('#D6ECF2'),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 78.0, left: 28),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage('assets/images/profile.png'),
                              minRadius: 25,
                              maxRadius: 25,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'welcome !',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('Reem', style: TextStyle(fontSize: 16)),
                            const SizedBox(height: 7,),
                            Text(
                              'How is it going today?',
                              style: TextStyle(color: HexColor('#221F1F'), fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 48.0, top: 78),
                        child: Column(
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
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 270, // Adjusted position to align with the bottom of the first container
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Center(
                          child: Image.asset('assets/images/Search.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> TopDoctorsScreen()));
                              },
                              child: Column(
                                children: [
                                  Showcase.withWidget(
                                      targetPadding: EdgeInsets.only(left: -3, right: -6, top: -2),
                                      targetShapeBorder: CircleBorder(),
                                      width: 370,
                                      height: 400,
                                      tooltipPosition: TooltipPosition.top,
                                      container: Container(
                                        margin: EdgeInsets.only(left: 20, bottom: 30),
                                          child: Image.asset("assets/images/snackbars.png")),
                                      key: _one,
                                      child: Image.asset('assets/images/top-doctors.png')),
                                  Text('Top Doctors')
                                ],
                              ),
                            ),
                            const SizedBox(width: 50,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>PharmacyScreen()));
                              },
                              child: Column(
                                children: [
                                  Image.asset('assets/images/pharmacy.png'),
                                  Text('Pharmacy')
                                ],
                              ),
                            ),
                            const SizedBox(width: 50,),

                            Column(
                              children: [
                                Image.asset('assets/images/ambulance.png'),
                                Text('Ambulance')
                              ],
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40, top: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Health article", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                            Text('See all', style: TextStyle(color: Theme.of(context).primaryColor,
                                fontSize: 14),)
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          controller: _scrollController,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0, right: 40),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
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
                                          Image.asset('assets/images/doctor.png'),
                                          const SizedBox(width: 10,),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.5,
                                            child:
                                            const Column(
                                              children: [
                                                Text('The 25 Healthiest Fruits You Can Eat, According to a Nutritionist', style:
                                                TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                                                const SizedBox(height: 6,),
                                                Row(
                                                  children: [
                                                    Text("Jun 10, 20223 ", style: TextStyle(fontSize: 8),),
                                                    const SizedBox(width: 7,),
                                                    Text("5min read", style: TextStyle(fontSize: 8),)
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 25.0),
                                        child: Image.asset('assets/images/Bookmark.png'),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12,),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0, right: 40),
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
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
                                          Image.asset('assets/images/globe.png'),
                                          const SizedBox(width: 10,),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.5,
                                            child:
                                            const Column(
                                              children: [
                                                Text('The Impact of COVID 19 on healthcare systems', style:
                                                TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                                                const SizedBox(height: 6,),
                                                Row(
                                                  children: [
                                                    Text("Jun 10, 20223 ", style: TextStyle(fontSize: 8),),
                                                    const SizedBox(width: 7,),
                                                    Text("5min read", style: TextStyle(fontSize: 8),)
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 25.0),
                                        child: Image.asset('assets/images/Bookmark.png'),
                                      ),

                                    ],
                                  ),
                                ),

                              ),
                            ),
                            const SizedBox(height: 12,),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0, right: 40),
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
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
                                          Image.asset('assets/images/globe.png'),
                                          const SizedBox(width: 10,),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.5,
                                            child:
                                            const Column(
                                              children: [
                                                Text('The Impact of COVID 19 on healthcare systems', style:
                                                TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                                                const SizedBox(height: 6,),
                                                Row(
                                                  children: [
                                                    Text("Jun 10, 20223 ", style: TextStyle(fontSize: 8),),
                                                    const SizedBox(width: 7,),
                                                    Text("5min read", style: TextStyle(fontSize: 8),)
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 25.0),
                                        child: Image.asset('assets/images/Bookmark.png'),
                                      ),

                                    ],
                                  ),
                                ),

                              ),
                            ),
                            const SizedBox(height: 12,),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0, right: 40),
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
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
                                          Image.asset('assets/images/globe.png'),
                                          const SizedBox(width: 10,),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.5,
                                            child:
                                            const Column(
                                              children: [
                                                Text('The Impact of COVID 19 on healthcare systems', style:
                                                TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                                                const SizedBox(height: 6,),
                                                Row(
                                                  children: [
                                                    Text("Jun 10, 20223 ", style: TextStyle(fontSize: 8),),
                                                    const SizedBox(width: 7,),
                                                    Text("5min read", style: TextStyle(fontSize: 8),)
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 25.0),
                                        child: Image.asset('assets/images/Bookmark.png'),
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
                ),
              )
            ],
      ),
        bottomNavigationBar: BottomBar(currentIndex: 0, twoKey: _two),
      );
      }),
    );
  }



}
