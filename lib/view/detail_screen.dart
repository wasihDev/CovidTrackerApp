import 'package:apis/utils/reusableRow.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String image;
  String name;
  int tottalCases,
      totalDeaths,
      totalRecovered,
      active,
      population,
      tests,
      critical;

  DetailScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.tottalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.population,
    required this.tests,
    required this.critical,
  }) : super(key: key);
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //  title: Text(widget.name),
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Center(
                      child: Card(
                          child: Column(
                        children: [
                          Center(
                            child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(widget.image)),
                          ),
                          ReusableRow(
                              title: "Cases",
                              value: widget.tottalCases.toString()),
                          ReusableRow(
                              title: "Recovered",
                              value: widget.totalRecovered.toString()),
                          ReusableRow(
                              title: "Deaths",
                              value: widget.totalDeaths.toString()),
                          ReusableRow(
                              title: "Active", value: widget.active.toString()),
                          ReusableRow(
                              title: "Population",
                              value: widget.population.toString()),
                          ReusableRow(
                              title: "Tests", value: widget.tests.toString()),
                          ReusableRow(
                              title: "Critical",
                              value: widget.critical.toString()),
                        ],
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
