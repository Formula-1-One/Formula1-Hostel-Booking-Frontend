import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/data/data.dart';
import '../../../pages_appbar_categories/logout.dart';
import '../details/details_screen.dart';
import '../home_screen_main.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/model/house.dart';


class SearchFilter extends StatefulWidget {
  const SearchFilter({Key? key}) : super(key: key);

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {


  final controller = TextEditingController();
  List<House> houses = houseList;

  void searchHouse(String query){
    final suggestions = houseList.where((house){
      final houseTitle = house.address.toLowerCase();
      final input = query.toLowerCase();
      return houseTitle.contains(input);
    }).toList();

    setState(() => houses = suggestions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade900, Colors.blue
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft
              )
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 80,
              left: 20,
              right: 20,
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search for hostel",
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0),
                    borderSide: const BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0),
                    borderSide: BorderSide(color: Colors.grey.shade400)),
              ),
              onChanged: searchHouse,
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: houses.length,
                itemBuilder: (context, int index)
                { final house = houses[index];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(house: house, key:UniqueKey()),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(house.address),
                  ),
                );
                },))
        ],
      ),

    );
  }
}
