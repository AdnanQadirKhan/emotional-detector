import 'package:emotion_detector/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text(
            'My cart',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        )),
        body: Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/product-1.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 170,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Panadol',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Text(
                                    "70ml ",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Image.asset("assets/images/counter-2.png")
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset('assets/images/Delete.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "\$9.99",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/product-2.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 170,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'OBH Cambi',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "75ml ",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Image.asset("assets/images/counter-2.png")
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset('assets/images/Delete.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "\$19.99",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 40),
                child: Text(
                  'Payment Detail',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                          fontSize: 14, color: Colors.grey.withOpacity(0.9)),
                    ),
                    Text('\$25.98',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.withOpacity(0.9))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Taxes',
                      style: TextStyle(
                          fontSize: 14, color: Colors.grey.withOpacity(0.9)),
                    ),
                    Text('\$1.00',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.withOpacity(0.9))),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text('\$26.98',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color:
                            Colors.grey.withOpacity(0.5)), // Only bottom border
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 40),
                child: Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 40, right: 40),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Image.asset("assets/images/VISA.png"),
                      ),
                      const Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "Change",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            "\$29.98",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ElevatedButton(
                          onPressed: () {
                            showModal(context);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blueAccent)),
                          child: const Text(
                            "Checkout",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          backgroundColor: Colors.white,
          title: Text("Payment Success", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),

          icon: Image.asset("assets/images/Done.png", height: 110,),
          actions: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 78.0),
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
            ),
          ],
        );
      },
    );
  }
}
