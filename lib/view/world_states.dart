import 'package:apis/models/world_states_model/world_states_model.dart';
import 'package:apis/services/stated_services.dart';
import 'package:apis/utils/reusableRow.dart';
import 'package:apis/view/countires_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color.fromARGB(255, 245, 15, 157),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(children: [
        SizedBox(height: height * .01),
        // ignore: prefer_const_constructors

        FutureBuilder(
            future: statesServices.fecthWorldStatesRecords(),
            builder: (context, AsyncSnapshot<worldStatesModel> snapshot) {
              // print(snapshot.data);
              // print('error here');
              if (!snapshot.hasData) {
                return Expanded(
                    flex: 1,
                    child: SpinKitFadingCircle(
                      color: Colors.black,
                      controller: _controller,
                      size: 50,
                    ));
              } else {
                return Column(
                  children: [
                    PieChart(
                      dataMap: {
                        "Total": double.parse(snapshot.data!.cases.toString()),
                        "Recovered":
                            double.parse(snapshot.data!.recovered.toString()),
                        "Deaths":
                            double.parse(snapshot.data!.deaths.toString()),
                        "Active":
                            double.parse(snapshot.data!.active.toString()),
                      },
                      chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true),
                      animationDuration: const Duration(milliseconds: 2333),
                      chartType: ChartType.ring,
                      colorList: colorList,
                    ),
                    SizedBox(height: height / 20),
                    Card(
                      child: Column(
                        children: [
                          ReusableRow(
                              title: 'Total Cases',
                              value: snapshot.data!.cases.toString()),
                          ReusableRow(
                              title: 'Active Cases',
                              value: snapshot.data!.active.toString()),
                          ReusableRow(
                              title: 'Total Deaths',
                              value: snapshot.data!.deaths.toString()),
                          ReusableRow(
                              title: 'Total Recovered',
                              value: snapshot.data!.recovered.toString()),
                          ReusableRow(
                              title: 'Affected Countries',
                              value:
                                  snapshot.data!.affectedCountries.toString()),
                        ],
                      ),
                    ),
                    SizedBox(height: height / 30),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CountriesListScreen()));
                      },
                      child: Container(
                          height: height * 0.08,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                              child: Text(
                            'Track Countries',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ))),
                    ),
                  ],
                );
              }
            }),
      ]),
    )));
  }
}
