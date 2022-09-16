import 'package:apis/services/stated_services.dart';
import 'package:apis/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black),
      body: SafeArea(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onChanged: (value) {
              setState(() {});
            },
            controller: searchController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                hintText: 'Search country name'),
          ),
        ),
        Expanded(
            child: FutureBuilder(
                future: statesServices.CounrtiesListApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Column(children: [
                                ListTile(
                                  leading: Container(
                                      height: 50,
                                      width: 89,
                                      color: Colors.white),
                                  title: Container(
                                      height: 20,
                                      width: 89,
                                      color: Colors.white),
                                  subtitle: Container(
                                      height: 20,
                                      width: 89,
                                      color: Colors.white),
                                )
                              ]));
                        });
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]['country'];

                          if (searchController.text.isEmpty) {
                            return Column(children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                                image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                name: snapshot.data![index]
                                                        ['countryInfo']
                                                    .toString(),
                                                tottalCases: snapshot
                                                    .data![index]['cases'],
                                                totalDeaths: snapshot
                                                    .data![index]['deaths'],
                                                totalRecovered: snapshot
                                                    .data![index]['recovered'],
                                                active: snapshot.data![index]
                                                    ['active'],
                                                population: snapshot
                                                    .data![index]['population'],
                                                tests: snapshot.data![index]
                                                    ['tests'],
                                                critical: snapshot.data![index]
                                                    ['critical'],
                                              )));
                                },
                                child: ListTile(
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']),
                                  ),
                                  title: Text(snapshot.data![index]['country']
                                      .toString()),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                ),
                              )
                            ]);
                          } else if (name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return Column(children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                                image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                name: snapshot.data![index]
                                                        ['countryInfo']
                                                    .toString(),
                                                tottalCases: snapshot
                                                    .data![index]['cases'],
                                                totalDeaths: snapshot
                                                    .data![index]['deaths'],
                                                totalRecovered: snapshot
                                                    .data![index]['recovered'],
                                                active: snapshot.data![index]
                                                    ['active'],
                                                population: snapshot
                                                    .data![index]['population'],
                                                tests: snapshot.data![index]
                                                    ['tests'],
                                                critical: snapshot.data![index]
                                                    ['critical'],
                                              )));
                                },
                                child: ListTile(
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']),
                                  ),
                                  title: Text(snapshot.data![index]['country']
                                      .toString()),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                ),
                              )
                            ]);
                          } else {
                            return Container();
                          }
                        });
                  }
                }))
      ])),
    );
  }
}
