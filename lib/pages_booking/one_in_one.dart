import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hostel_booking_app_ui_f1/pages_booking/control_room.dart';

class OneInOne extends StatefulWidget {
  const OneInOne({Key? key}) : super(key: key);

  @override
  State<OneInOne> createState() => _OneInOneState();
}

class _OneInOneState extends State<OneInOne> {

  RoomController controller = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height:40),
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(Icons.arrow_back_rounded, color: Colors.black,),
                      ),
                    ),
                    Text('Select your\nroom',
                      style: TextStyle(
                        fontSize: 25,
                      ),),
                    Text(' Line {A}\n 1-3A',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey
                      ),)
                  ],
                ),
              ),
              Container(
                height: 50,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // Extracted widget
                    itemStatus(
                      status: "Available",
                      color: Colors.grey,
                    ),
                    // Extracted widget
                    itemStatus(
                      status: "Filled",
                      color: Colors.amber,
                    ),
                    // Extracted widget
                    itemStatus(
                      status: "Selected",
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft:Radius.circular(25),
                      topRight: Radius.circular(25),
                    )
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Unity',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('A',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),),
                                  Text('B',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),),
                                  Text('C',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),),
                                  Text('D',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),),
                                  Text('E',
                                    style: TextStyle(
                                        fontSize: 25, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                            height: 400,
                            color: Colors.white,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Obx(() => Column(
                              children: List.generate(
                                    controller.gerbong.length,
                                    (index) =>GestureDetector(
                                      onTap: () => controller.gaintGerbong(index),
                                      child: Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      color: controller.indexGerbong.value ==
                                          index ? Colors.blue : Colors.white,
                                  ),
                                  height: 150,
                                  child: Center(
                                        child: Text('${index + 1}')
                                  ),
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        ),
                        ),

                        const SizedBox(width: 20,),
                        Expanded(child: Container(
                          color: Colors.white,
                          child: Obx(() =>
                              GridView.builder(
                                  padding: const EdgeInsets.all(10),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    crossAxisCount: 5,),
                                  itemCount:  controller.gerbong[controller.indexGerbong.value].length,
                                  itemBuilder: (context, index) => GestureDetector(
                                    onTap: () => controller.selectKursi(index),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black38
                                        ),
                                        color : (controller.gerbong[controller.indexGerbong.value]
                                        [index]['status'] == "available"
                                            ? Colors.white : controller.gerbong[controller.indexGerbong.value]
                                        [index]['status'] == "filled" ? Colors.amber : Colors.blue),
                                        borderRadius: BorderRadius.circular(10),
                                      ),

                                    ),
                                  )),
                          )
                        )
                        ),
                      ],
                    ),
                    ),
                  ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4,),
              Container(
                height: 50,
                color: Colors.blue,
                child: ElevatedButton(onPressed: (){}, child: Text('Select Your Room'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  fixedSize: Size( 300, 10 ),
                ),),
              ),
              const SizedBox(height: 20,)
            ],
          )
        ],
      ),
    );
  }
}

class itemStatus extends StatelessWidget {
  const itemStatus({
    Key? key,
    required this.status,
    required this.color,
  }) : super(key: key);

  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 35,
          width: 35,
          color: color,
        ),
        Text(status,
          style: const TextStyle(
          fontSize: 18,
        ),)
      ],
    );
  }
}
