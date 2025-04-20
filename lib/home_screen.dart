import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bestLevel = 0;
  int bestTime = 0;

  @override
  void initState() {
    super.initState();
    _loadBestScore();
  }

  Future<void> _loadBestScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      bestLevel = prefs.getInt('best_level') ?? 0;
      bestTime = prefs.getInt('best_time') ?? 0;
    });
  }

  String _formatTime(int milliseconds) {
    final duration = Duration(milliseconds: milliseconds);
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    final centiseconds = (duration.inMilliseconds.remainder(1000) ~/ 10)
        .toString()
        .padLeft(2, '0');
    return "$minutes:$seconds.$centiseconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inuka LV'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GameScreen()),
                  ).then((_) => _loadBestScore()); // recharge score au retour
                },
                child: const Text('JOUER'),
              ),
              const SizedBox(height: 20),
              Text(
                '🧠 Record : niveau ($bestLevel) ${_formatTime(bestTime)}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
