import 'package:flutter/material.dart';

class ExerciseCard extends StatefulWidget {
  final String title;
  final Function onCompleted;
  final int value;

  const ExerciseCard({
    required this.title,
    required this.onCompleted,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  _ExerciseCardState createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(width: 20.0,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title),
                Text((widget.title == "Runs") ? ((widget.value)*3/100).toString()+"km" : widget.value.toString()),
              ],
            ),
          ),
          SizedBox(width: 30.0,),
          SizedBox(
            width: 120.0,
            child: ElevatedButton(
              onPressed: _isCompleted ? null : _onCompleted,
              child: Text(_isCompleted ? 'Completed!' : 'Done'),
            ),
          ),
          SizedBox(width: 5.0,),
        ],
      ),
    );
  }

  void _onCompleted() {
    setState(() {
      _isCompleted = true;
    });
    widget.onCompleted();
  }
}