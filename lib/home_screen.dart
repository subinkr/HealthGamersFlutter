import 'package:flutter/material.dart';
import 'package:untitled5/exercise_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pushUpsCount = 100;
  int _squatsCount = 100;
  int _runsCount = 100;
  int _PowerCoin = 0;
  int _AgilityCoin = 0;
  int _StaminaCoin = 0;

  int characterPower = 0;
  int characterAgility = 0;
  int characterStamina = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Fitness App'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width - 20,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              // color: Colors.blue,
                              child: Center(
                                child: Image.asset("assets/img/1.png"),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              // color: Colors.green,
                              child: Center(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text('Power: '),
                                      trailing: Text('${characterPower}'),
                                    ),
                                    ListTile(
                                      title: Text('Agility: '),
                                      trailing: Text('${characterAgility}'),
                                    ),
                                    ListTile(
                                      title: Text('Stamina: '),
                                      trailing: Text('${characterStamina}'),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                          child: Center(child: Text('He liked games and meals since he was young, so he lived an unhealthy life, but one day he got a medical checkup and thought about his health.', textAlign: TextAlign.center,))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // 대표 캐릭터 설정 버튼 동작
                      },
                      child: Text('Set main character'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 320.0,
                child: ExerciseCard(
                  title: 'Push-Ups',
                  value: _pushUpsCount,
                  onCompleted: () {
                    setState(() {
                      if (_pushUpsCount < 100) {
                        _pushUpsCount++;
                      } else {
                        _PowerCoin++;
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                width: 320.0,
                child: ExerciseCard(
                  title: 'Squats',
                  value: _squatsCount,
                  onCompleted: () {
                    setState(() {
                      if (_squatsCount < 100) {
                        _squatsCount++;
                      } else {
                        _AgilityCoin++;
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                width: 320.0,
                child: ExerciseCard(
                  title: 'Runs',
                  value: _runsCount,
                  onCompleted: () {
                    setState(() {
                      if (_runsCount < 100) {
                        _runsCount++;
                      } else {
                        _StaminaCoin++;
                      }
                    });
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Coins earned',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      ListTile(
                        title: Text('Power: '),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${_PowerCoin} coins'),
                            SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                                onPressed: (_PowerCoin > 0)
                                    ? () {
                                        setState(() {
                                          _PowerCoin--;
                                          characterPower++;
                                        });
                                      }
                                    : null,
                                child: Text('Use')),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text('Agility: '),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${_AgilityCoin} coins'),
                            SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                                onPressed: (_AgilityCoin > 0)
                                    ? () {
                                        setState(() {
                                          _AgilityCoin--;
                                          characterAgility++;
                                        });
                                      }
                                    : null,
                                child: Text('Use')),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text('Stamina: '),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${_StaminaCoin} coins'),
                            SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                                onPressed: (_StaminaCoin > 0)
                                    ? () {
                                        setState(() {
                                          _StaminaCoin--;
                                          characterStamina++;
                                        });
                                      }
                                    : null,
                                child: Text('Use')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet),
              label: 'Eanking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_mark_outlined),
              label: 'Quest',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.storefront_outlined),
              label: 'Shop',
            ),
          ],
          // currentIndex: _selectedIndex, // 지정 인덱스로 이동
          // selectedItemColor: Colors.lightGreen,
          // onTap: _onItemTapped, // 선언했던 onItemTapped
        ),
      ),
    );
  }
}
