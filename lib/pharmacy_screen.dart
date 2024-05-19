import 'package:emotion_detector/pharmacy_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({super.key});

  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
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
          Image.asset('assets/images/search-pharmacy.png'),
          const SizedBox(height: 25),
          Image.asset('assets/images/banner.png'),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Product",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40, top: 13, right: 40),
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PharmacyDetailScreen(
                                image: "assets/images/medicine.png",
                                name: "Panadol",
                                price: "15.99",
                                quantity: "20pcs")));
                  },
                  child: Container(
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey)),
                    child: Column(children: [
                      Container(
                          height: 110,
                          width: 130,
                          child: Image.asset("assets/images/product-1.png")),
                      Text(
                        "Panadol",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Text(
                        "20pcs",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$15.99",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Image.asset("assets/images/add.png")
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PharmacyDetailScreen(
                                image: "assets/images/medicine.png",
                                name: "Bodrex Herbal",
                                price: "7.99",
                                quantity: "100ml")));
                  },
                  child: Container(
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey)),
                    child: Column(children: [
                      Container(
                          height: 110,
                          width: 130,
                          child: Image.asset("assets/images/product-2.png")),
                      Text(
                        "Bodrex Herbal",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Text(
                        "100ml",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$7.99",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Image.asset("assets/images/add.png")
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PharmacyDetailScreen(
                                image: "assets/images/medicine.png",
                                name: "Bodrex Herbal",
                                price: "7.99",
                                quantity: "100ml")));
                  },
                  child: Container(
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey)),
                    child: Column(children: [
                      Container(
                          height: 110,
                          width: 130,
                          child: Image.asset("assets/images/product-2.png")),
                      Text(
                        "Bodrex Herbal",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Text(
                        "100ml",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$7.99",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Image.asset("assets/images/add.png")
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product on sale",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40, top: 13, right: 40),
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PharmacyDetailScreen(
                                image: "assets/images/medicine.png",
                                name: "Panadol",
                                price: "15.99",
                                quantity: "20pcs")));
                  },
                  child: Container(
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey)),
                    child: Column(children: [
                      Container(
                          height: 110,
                          width: 130,
                          child: Image.asset("assets/images/product-1.png")),
                      Text(
                        "Panadol",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Text(
                        "20pcs",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$15.99",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Image.asset("assets/images/add.png")
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PharmacyDetailScreen(
                                image: "assets/images/medicine.png",
                                name: "Bodrex Herbal",
                                price: "7.99",
                                quantity: "100ml")));
                  },
                  child: Container(
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey)),
                    child: Column(children: [
                      Container(
                          height: 110,
                          width: 130,
                          child: Image.asset("assets/images/product-2.png")),
                      Text(
                        "Bodrex Herbal",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Text(
                        "100ml",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$7.99",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Image.asset("assets/images/add.png")
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PharmacyDetailScreen(
                                image: "assets/images/medicine.png",
                                name: "Bodrex Herbal",
                                price: "7.99",
                                quantity: "100ml")));
                  },
                  child: Container(
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey)),
                    child: Column(children: [
                      Container(
                          height: 110,
                          width: 130,
                          child: Image.asset("assets/images/product-2.png")),
                      Text(
                        "Bodrex Herbal",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Text(
                        "100ml",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$7.99",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Image.asset("assets/images/add.png")
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
