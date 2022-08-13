import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/constants/constants.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/data/data.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();

}

class _CategoriesState extends State<Categories> {
  
  int selectedCategoryIndex = 0;

  Widget _buildCategory(BuildContext context, int index) {
  
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategoryIndex = index;
        });
      },
      child: Padding(padding: const EdgeInsets.only(right: appPadding / 3),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
        width: size.width * 0.25,
        decoration: BoxDecoration(
          color: selectedCategoryIndex == index ? darkBlue: black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            categoryList[index], style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: selectedCategoryIndex == index ? white: black,
            ),
          ),
        ),
      ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        left: appPadding,
        top: appPadding / 2,
        bottom: appPadding,
      ),
      child: Container(
      height: size.height * 0.05,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index){
          return _buildCategory(context, index);
        },
        ),       
      ),
    );
  }
}