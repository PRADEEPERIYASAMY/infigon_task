import 'package:flutter/cupertino.dart';
import 'package:infigon_task/models/BarChartModel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarGraph extends StatefulWidget {
  final List<BarChartModel> data;

  const BarGraph({Key key, this.data}) : super(key: key);

  @override
  _BarGraphState createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  @override
  Widget build(BuildContext context) {

    // creating chart series
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "Marks",
        data: widget.data,
        domainFn: (BarChartModel series, _) => series.subject,
        measureFn: (BarChartModel series, _) => series.mark,
        fillColorFn: (BarChartModel sales, _) =>
            charts.Color.fromHex(code: "#3776fe"),
      )
    ];

    return _buildFinancialList(series);
  }

  // function return bar-chart widget
  Widget _buildFinancialList(series) {
    return charts.BarChart(
      series,
      animate: true,
      vertical: true,
    );
  }
}
