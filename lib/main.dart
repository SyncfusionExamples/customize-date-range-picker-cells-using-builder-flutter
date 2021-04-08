import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(CellBuilderPicker());

class CellBuilderPicker extends StatefulWidget {
  @override
  ViewNavigationState createState() => ViewNavigationState();
}

class ViewNavigationState extends State<CellBuilderPicker> {
  final DateRangePickerController _controller = DateRangePickerController();

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
          Container(
            child: Icon(
              Icons.wb_sunny,
              color: Colors.yellow,
            ),
          ),
          Container(
            child: Text(DateFormat('dd').format(cellDetails.date)),
          )
        ],
      );
    } else if (_controller.view == DateRangePickerView.year) {
      return Column(
        children: [
          Container(
            child: Icon(
              Icons.wb_sunny,
              color: Colors.yellow,
            ),
          ),
          Container(
            child: Text(DateFormat('MMM').format(cellDetails.date)),
          )
        ],
      );
    } else if (_controller.view == DateRangePickerView.decade) {
      return Column(
        children: [
          Container(
            child: Icon(
              Icons.wb_sunny,
              color: Colors.yellow,
            ),
          ),
          Container(
            child: Text(DateFormat('yyy').format(cellDetails.date)),
          )
        ],
      );
    } else {
      final int yearValue = cellDetails.date.year;
      return Column(
        children: [
          Container(
            child: Icon(
              Icons.wb_sunny,
              color: Colors.yellow,
            ),
          ),
          Container(
            child:
                Text(yearValue.toString() + ' - ' + (yearValue + 9).toString()),
          )
        ],
      );
    }
  }
}
