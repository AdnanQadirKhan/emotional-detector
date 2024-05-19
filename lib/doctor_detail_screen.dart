import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:emotion_detector/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'main.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'dart:async'; // Import async library

class DoctorDetailScreen extends StatefulWidget {
  final String doctorName, image, profession;
  const DoctorDetailScreen(
      {super.key,
      required this.doctorName,
      required this.image,
      required this.profession});

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  String? selectedTimeSlot;
  final PageController _pageController = PageController();
  int _currentPage = 0;
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  Timer? timer;
  bool negativeDetected = false; // Add a variable to track if any Negative Emotion' is detected

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
          title: Center(
            child: Text(
              'Doctor Detail',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 25, right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
          
                    Row(
                      children: [
                        Image.asset(widget.image),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.doctorName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(widget.profession,
                                style: TextStyle(fontSize: 12, color: Colors.grey)),
                            const SizedBox(
                              height: 8,
                            ),
                            Image.asset("assets/images/rating.png"),
                            Text("273 Reviews",
                                style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
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
                        Text(output,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20))
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 10.0, top: 20),
                child: Row(
                  children: [
                    Text(
                      "About",
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(widget.doctorName +
                          " is a highly experienced and compassionate " +
                          widget.profession +
                          " with expertise in diagnosing and treating various heart conditions. He completed his  education."),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 30),
                child: EasyDateTimeLine(
                  initialDate: DateTime.now(),
          
                  dayProps: const EasyDayProps(
                    dayStructure: DayStructure.dayStrDayNum,
                    activeDayStyle: DayStyle(
                      borderRadius: 25
                    ),
                    inactiveDayStyle: DayStyle(
                      borderRadius: 25
                    )
          
                  ),
                  headerProps: EasyHeaderProps(
                    showHeader: false
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  timeSlotButton("09:00 AM"),
                  const SizedBox(width: 15),
                  timeSlotButton("10:00 AM"),
                  const SizedBox(width: 15),
                  timeSlotButton("11:00 AM"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  timeSlotButton("02:00 PM"),
                  const SizedBox(width: 15),
                  timeSlotButton("04:00 PM"),
                  const SizedBox(width: 15),
                  timeSlotButton("05:00 PM"),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  timeSlotButton("07:00 PM"),
                  const SizedBox(width: 15),
                  timeSlotButton("08:00 PM"),
                  const SizedBox(width: 15),
                  timeSlotButton("09:00 PM"),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: (){
                    if(output == '2 Angry') {
                      showModalAngry(context);
                    }
                    else{
                      showModal(context);
                    }
                  },
                  child: Text("Book Appointment", style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(17)),
                    backgroundColor: MaterialStateProperty.all(Colors.blueAccent)
                  ),
                ),
              )
          
          
          
            ],
          ),
        )
    );
  }
  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            "Booking Confirmed!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          content: Text(
            "The booking confirmation has been sent to your Email Address",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          icon: Image.asset("assets/images/Done.png", height: 110,),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                ),
                child: Text("Back to Home", style: TextStyle(color: Colors.white, fontSize: 16),),
              ),
            ),
          ],
        );
      },
    );
  }

  void showModalAngry(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            "Booking Confirmed!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "The booking confirmation has been sent to your Email Address",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/images/slider.png"),
                  const SizedBox(width: 80,),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      showModalAngry2(context);
                    },
                    child: Image.asset("assets/images/Button.png"),
                  ),
                ],
              ),
            ],
          ),
          icon: Image.asset("assets/images/Done.png", height: 110,),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                ),
                child: Text("Back to Home", style: TextStyle(color: Colors.white, fontSize: 16),),
              ),
            ),
          ],
        );
      },
    );
  }

  void showModalAngry2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Image.asset(widget.image, height: 90,),
          content: Text(widget.doctorName, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,),textAlign:
            TextAlign.center,),
          icon: Image.asset("assets/images/Done.png", height: 110,),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        );
      },
    );
  }


  Widget timeSlotButton(String timeSlot) {
    bool isSelected = selectedTimeSlot == timeSlot;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          // Toggle selection
          selectedTimeSlot = isSelected ? null : timeSlot;
        });
      },
      child: Text(
        timeSlot,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              // Change background color when pressed
              return Colors.grey; // Adjust color as needed
            }
            // Default background color
            return isSelected ? Colors.blueAccent : Colors.white;
          },
        ),
      ),
    );
  }
}

