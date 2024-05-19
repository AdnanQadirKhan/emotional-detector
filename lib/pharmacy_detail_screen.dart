import 'package:emotion_detector/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:camera/camera.dart';
import 'main.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'dart:async'; // Import async library

class PharmacyDetailScreen extends StatefulWidget {
  final String image, name, quantity, price;
  const PharmacyDetailScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });

  @override
  State<PharmacyDetailScreen> createState() => _PharmacyDetailScreenState();
}

class _PharmacyDetailScreenState extends State<PharmacyDetailScreen> {
  bool isExpanded = false;
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  bool negativeDetected = false; // Add a variable to track if any Negative Emotion' is detected
  Timer? timer; // Declare a Timer variable
  int counter = 0; // Add a counter variable
  int increaseCount = 0; // Variable to count how many times user increases
  int decreaseCount = 0; // Variable to count how many times user decreases
  bool decreaseCheck = false;
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
          if ((output == '1 Sad' || output == '2 Angry' || output == '3 Fearful') && !negativeDetected) {
            negativeDetected = true; // Set the flag to true
            timer = Timer(Duration(seconds: 30), () {
              setState(() {
                negativeDetected = false; // Reset the flag after 10 seconds
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Pharmacy',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.image,
                  height: 200,
                  width: 200,
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
                    Text(output,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.quantity,
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                Image.asset("assets/images/like.png"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40, top: 15),
            child: Row(
              children: [
                Image.asset("assets/images/rating-new.png"),
              ],
            ),
          ),
          if (!decreaseCheck)
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if(counter!=0) {
                              counter--;
                              if(decreaseCount<1) {
                                 decreaseCount++;
                              }
                              else {
                                decreaseCheck = true;
                              }
                            }
                          });
                        },
                        icon: Icon(Icons.remove),
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        counter.toString(),
                        style: TextStyle(fontSize: 19),
                      ),
                      const SizedBox(width: 20,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              counter++;
                              increaseCount++;
                            });
                          },
                          color: Colors.white,
                          icon: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "\$" + widget.price,
                    style: TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          if (negativeDetected && decreaseCheck)
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, top: 20),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: HexColor('#F7D9A4')),
                    color: HexColor('#FFF8EC'),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/Icon.png"),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Unsure about the quantity?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                child: Text(
                                  isExpanded
                                      ? "less details..."
                                      : "more details...",
                                  style: TextStyle(
                                      color: HexColor('#407CE2'),
                                      fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              negativeDetected = !negativeDetected;
                              decreaseCheck = false;
                            },
                            child: Image.asset(
                                "assets/images/Close button.png"))
                      ],
                    ),
                    if (isExpanded)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Based on your prescription history, we've prepared some suggestions:",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              "2-week supply: 1 bottle",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              "1-month supply: 2 bottles",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              "2-month supply: 4 bottles",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 30),
            child: Row(
              children: [
                Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 10),
            child: Row(
              children: [
                Container(
                    width: 300,
                    child: Text(
                      widget.name +
                          " is a cough medicine containing, Paracetamol, Ephedrine HCl, and Chlorphenamine maleate which is used to relieve coughs accompanied by flu symptoms such as fever, headache, and sneezing... Read more",
                      style:
                      TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
                    ))
              ],
            ),
          ),
          const SizedBox(height: 60),
          Container(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CheckoutScreen()));
              },
              child: Text(
                "Buy Now",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.blueAccent)),
            ),
          )
        ],
      ),
    );
  }
}
