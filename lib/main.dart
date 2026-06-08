import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showBtn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (showBtn == true) {
                    showBtn = false;
                  } else {
                    showBtn = true;
                  }
                });
              },
              child: Text(showBtn ? 'Hide Btn' : 'Show Btn'),
            ),

            if (showBtn)
              const ClickCounterButton(
                color: Colors.red,
              ),

            if (showBtn)
              const ClickCounterButton(
                color: Colors.blue,
              ),
          ],
        ),
      ),
    );
  }
}

class ClickCounterButton extends StatefulWidget {
  final Color color;

  const ClickCounterButton({
    super.key,
    required this.color,
  });

  @override
  State<ClickCounterButton> createState() => _ClickCounterButtonState();
}

class _ClickCounterButtonState extends State<ClickCounterButton> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Text(
          'Clicked $count',
          style: TextStyle(color: widget.color),
        ),
      ),
    );
  }

  @override
  void dispose() {
    debugPrint('${widget.color} button disposed');
    super.dispose();
  }
}