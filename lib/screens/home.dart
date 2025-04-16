import 'package:delivery_app/const.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  bool isSearch = false;
  List<bool> isSelected = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0 
              ),
              child: !isSearch ?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSearch = true;
                            });
                          },
                          child: stack(Icons.search_outlined),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0),
                              child: Text("Location",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17
                                ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:30.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.location_on_rounded,
                                  color: color1,
                                  size: 30,),
                                  SizedBox(width: 10,),
                                  Text("Nagoya,Japan",
                                    style: TextStyle(
                                      color: color2,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20
                                    ),),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10,),
                        stack(Icons.notifications_outlined)
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: color1
                          ),
                        ),
                        Positioned(
                          left: 160,
                          child: Image.asset('asset/images/burger.png',
                          height: 210,
                          width: 210,
                          fit:BoxFit.fill,),
                        ),
                        Positioned(
                          left: 15,
                          top: 20,
                          child: Column(
                            children: [
                              Text("Get special discount",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                                ),),
                              SizedBox(height: 10,),
                              Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Text("Up to 95%",
                                  style: TextStyle(
                                    color: color3,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                  ),),
                              ),
                              SizedBox(height: 20,),
                              Padding(
                                padding: EdgeInsets.only(right: 18),
                                child: Container(
                                  height: 35,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: color3,
                                    borderRadius: BorderRadius.circular(60)
                                  ),
                                  child: Center(
                                    child: Text("Claim voucher",
                                    style: TextStyle(
                                      color: color1,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800
                                    ),)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 150,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                          SizedBox(width: 10,),
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected[index] = true;
                                for (var i = 0; i < isSelected.length; i++) {
                                  if (isSelected[i] == true && i != index) {
                                    isSelected[i] = false;
                                  }
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: isSelected[index] ? color1 : color3
                              ),
                              height: 120,
                              width: 110,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(99),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 60,
                                              color: isSelected[index] ? color3 : color4
                                            ),
                                            Positioned(
                                              left: 5,
                                              top: 5,
                                              child: Image.asset(
                                                'asset/images/burger.png',
                                                height: 50,
                                                width: 50,
                                                fit: BoxFit.fill,),
                                            )
                                          ],
                                        ))
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Text("Burger",
                                  style: TextStyle(
                                    color: color2,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                  ),)
                                ],
                              ),
                            ),
                          );
                        },),
                    )
                  ],
                ),
              ) :
              searchBar()
            )
          ],
        )
      )
    ); 
  }

  Widget searchBar() {
    return Column(
      children: [
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: SizedBox(
            height: 50,
            child: TextFormField(
              cursorColor: color2,
              decoration: InputDecoration(
                filled: true,
                fillColor: color4,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent 
                  ),
                  borderRadius: BorderRadius.circular(60)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent
                  ),
                  borderRadius: BorderRadius.circular(60)
                ),
                prefixIcon: Icon(Icons.search_outlined),
                hintText: "Search",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold
                )
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color3,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9)
            )
          ),
          onPressed: () {
            setState(() {
              isSearch = false;
            });
          },
          child: Icon(Icons.close,
          color: color2,),
        )
      ],
    );
  }
}

Widget stack(IconData icon) {
  return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(99),
          child: Container(
            width: 54,
            height: 54,
            color: color3,
          ),
        ),
        Positioned(
          bottom: 11,
          left: 12.5,
          child: Icon(
            icon,
            size: 30,
          ),
        )
      ],
    );
}

