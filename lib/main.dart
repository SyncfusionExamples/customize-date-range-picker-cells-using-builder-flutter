import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(const CellBuilderPicker());

class CellBuilderPicker extends StatefulWidget {
  const CellBuilderPicker({super.key});

  @override
  ViewNavigationState createState() => ViewNavigationState();
}

class ViewNavigationState extends State<CellBuilderPicker> {
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Card(
            margin: const EdgeInsets.fromLTRB(50, 150, 50, 150),
            child: SfDateRangePicker(
              view: DateRangePickerView.month,
              controller: _controller,
              cellBuilder: cellBuilder,
            ),
          ),
        ),
      ),
    );
  }

  Widget cellBuilder(
      BuildContext context, DateRangePickerCellDetails cellDetails) {
    if (_controller.view == DateRangePickerView.month) {
      return Column(
        children: [
          const Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
          Text(DateFormat('dd').format(cellDetails.date))
        ],
      );
    } else if (_controller.view == DateRangePickerView.year) {
      return Column(
        children: [
          const Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
          Text(DateFormat('MMM').format(cellDetails.date))
        ],
      );
    } else if (_controller.view == DateRangePickerView.decade) {
      return Column(
        children: [
          const Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
          Text(DateFormat('yyy').format(cellDetails.date))
        ],
      );
    } else {
      final int yearValue = cellDetails.date.year;
      return Column(
        children: [
          const Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
          Text('$yearValue - ${yearValue + 9}')
        ],
      );
    }
  }
}