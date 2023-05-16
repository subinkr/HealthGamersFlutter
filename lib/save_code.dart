import 'package:flutter/material.dart';

class Status {
  final String name;
  int count;
  int coin;

  Status({required this.name, this.count = 0, this.coin = 0});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Status> statusList = [
    Status(name: 'Push-ups'),
    Status(name: 'Squats'),
    Status(name: 'Runs'),
  ];

  void _updateStatus() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var status in statusList)
              StatusForm(status: status, onSubmit: _updateStatus),
            SizedBox(height: 16),
            Text(
              'Coins earned',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Column(
              children: [
                for (var status in statusList)
                  ListTile(
                    title: Text(status.name),
                    trailing: Text('${status.coin} coins'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatusForm extends StatefulWidget {
  final Status status;
  final Function onSubmit;

  const StatusForm({required this.status, required this.onSubmit});

  @override
  _StatusFormState createState() => _StatusFormState();
}

class _StatusFormState extends State<StatusForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.status.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Count: ${widget.status.count}'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.status.count++;
                    widget.status.coin++;
                  });
                  widget.onSubmit();
                },
                child: Text('Done'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
