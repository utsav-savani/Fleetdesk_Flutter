import 'package:fleetdesk_flutter/domain/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartExample extends StatelessWidget {
  final HomePageController _homePageController = Get.find();
  late List<ChartData> chartData;

  PieChartExample({Key? key}) : super(key: key) {
    chartData = [
      ChartData(
        'Pending',
        _homePageController.pendingTaskCount,
        color: const Color(0xff006633),
      ),
      ChartData(
        'Completed',
        _homePageController.completedTaskCount,
        color: const Color(0xff330066),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks Report"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SfCircularChart(
              series: <CircularSeries>[
                PieSeries<ChartData, String>(
                    dataSource: chartData,
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    explode: true,
                    dataLabelMapper: (ChartData data, _) =>
                        data.y.toInt().toString(),
                    enableTooltip: true,
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xff006633),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text('Pending'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 150,
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xff330066),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text('Completed'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, {this.color});

  final String x;
  final double y;
  Color? color;
}
