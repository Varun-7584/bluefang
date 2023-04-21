// ignore_for_file: deprecated_member_use

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_vehicle_list_items.dart';
import 'package:flutter/material.dart';
import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';

class ExampleSliver extends StatefulWidget {
  @override
  _ExampleSliverState createState() => _ExampleSliverState();
}

class _ExampleSliverState extends State<ExampleSliver> {
  List<ExampleSection> sectionList = MockData.getExampleSections();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bFAppBar(title: 'Home'),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverExpandableList(
              builder: SliverExpandableChildDelegate<String, ExampleSection>(
                sectionList: sectionList,
                headerBuilder: _buildHeader,
                itemBuilder: (context, sectionIndex, itemIndex, index) {
                  final String item =
                      sectionList[sectionIndex].items[itemIndex];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        BFCardVehicleList(
                          vehNumberText: '${123456 * (itemIndex + 1)}',
                          vehModelText: item,
                          vehYearText: "21",
                          lifeDistText: '${978776456 * (itemIndex + 765765)} mi',
                          image: Image.asset("assets/images/DistanceIcon.png"),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, int sectionIndex, int index) {
    final ExampleSection section = sectionList[sectionIndex];
    final IconData trailingIcon = section.isSectionExpanded()
        ? Icons.keyboard_arrow_up
        : Icons.keyboard_arrow_down;
    return Column(
      children: [
        BFExpandableVehicleList(
            leading: Image.network(
                'https://www.fueloyal.com/wp-content/uploads/2017/04/50-Best-Trucking-Company-Logos-01.png'),
            text: section.header,
            subtext: '100 vechiles',
            trailingIcon: trailingIcon,
            onTap: () {
              setState(() {
                section.setSectionExpanded(!section.isSectionExpanded());
              });
            }),
        const SizedBox(height: 10),
      ],
    );
  }
}
