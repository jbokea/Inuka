import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/game/widgets/grid_phase.dart';
import 'screens/game/widgets/memorisation_phase.dart';
import 'screens/game/widgets/game_result_overlay.dart';

void main() => runApp(const FlashApp());

class FlashApp extends StatelessWidget {
  const FlashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String bestScore = "(0) 00:00.00";

  @override
  void initState() {
    super.initState();
    _loadBestScore();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadBestScore();
  }

  Future<void> _loadBestScore() async {
    final prefs = await SharedPreferences.getInstance();
    int bestLevel = prefs.getInt('best_level') ?? 0;
    int bestTime = prefs.getInt('best_time') ?? 0;

    setState(() {
      bestScore = "($bestLevel) ${_formatTime(bestTime)}";
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
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text("Inuka LV", style: TextStyle(fontSize: 26)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const GameScreen()));
              },
              child: const Text("JOUER"),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.memory_outlined),
                const SizedBox(width: 6),
                Text("Record actuel : $bestScore",
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int level = 1;
  int lastValidLevel = 0;
  int totalTime = 0;
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;
  String currentDisplayTime = "00:00.00";

  List<String> allSymbols = List.generate(59,
      (i) => 'assets/symbole/symbole${(i + 1).toString().padLeft(2, '0')}.png');
  List<String> levelSymbols = [];
  List<String> gridSymbols = [];
  List<String> selectedSymbols = [];
  Set<int> correctSelections = {};
  int currentIndex = 0;
  bool showGrid = false;
  bool showMessage = false;
  bool isGameOver = false;
  String message = '';
  String instruction = '';
  final Random random = Random();

  final List<List<String>> interferences = [
    ['spark', 'étincelle'],
    ['path', 'chemin'],
    ['insight', 'lucidité'],
    ['threshold', 'seuil'],
    ['flare', 'flambée'],
    ['summit', 'sommet'],
    ['dusk', 'crépuscule'],
    ['hollow', 'creux'],
    ['rift', 'faille'],
    ['might', 'puissance'],
    ['valor', 'bravoure'],
    ['blast', 'explosion'],
    ['grit', 'cran'],
    ['sought', 'chercher'],
    ['led', 'mener'],
    ['built', 'construire'],
    ['held', 'tenir'],
    ['rose', 's’élever'],
    ['overcame', 'surmonter'],
    ['sank', 'sombrer'],
    ['bled', 'saigner'],
    ['bent', 'plier'],
    ['clung', 's’accrocher'],
    ['swore', 'jurer'],
    ['stood', 'se tenir'],
    ['taught', 'enseigner'],
    ['win', 'gagner'],
    ['dare', 'oser'],
    ['throve', 'prospérer'],
    ['grasped', 'saisir'],
    ['bound', 'lier'],
    ['strode', 'marcher à grands pas'],
    ['smote', 'frapper']
  ];

  @override
  void initState() {
    super.initState();
    _startLevel();
  }

  void _startLevel() {
    levelSymbols.clear();
    gridSymbols.clear();
    selectedSymbols.clear();
    correctSelections.clear();
    showGrid = false;
    showMessage = false;
    isGameOver = false;
    message = '';
    instruction = '';
    currentIndex = 0;

    List<String> pool = List.from(allSymbols)..shuffle();
    int numSymbols = level.clamp(1, 20);
    levelSymbols = pool.take(numSymbols).toList();
    pool.removeWhere((s) => levelSymbols.contains(s));

    gridSymbols = [...levelSymbols];
    gridSymbols.addAll(pool.take(20 - levelSymbols.length));
    gridSymbols.shuffle();

    setState(() {});
    _showNextSymbol();
  }

  void _showNextSymbol() {
    if (currentIndex < levelSymbols.length) {
      setState(() => instruction = 'Mémorise');
      Timer(const Duration(milliseconds: 800), () {
        setState(() => instruction = 'Lis');
        Timer(const Duration(seconds: 2), () {
          currentIndex++;
          _showNextSymbol();
        });
      });
    } else {
      setState(() {
        instruction = "Restitue dans l'ordre";
        showGrid = true;
        _startTimer();
      });
    }
  }

  void _startTimer() {
    stopwatch.reset();
    stopwatch.start();
    timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {
        currentDisplayTime = _formatTime(stopwatch.elapsedMilliseconds);
      });
    });
  }

  void _stopTimer() {
    stopwatch.stop();
    timer?.cancel();
    setState(() {
      currentDisplayTime = _formatTime(stopwatch.elapsedMilliseconds);
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

  void _selectSymbol(String symbol) async {
    if (selectedSymbols.length >= levelSymbols.length || showMessage) return;

    int current = selectedSymbols.length;
    bool correct = symbol == levelSymbols[current];

    setState(() {
      selectedSymbols.add(symbol);
      if (correct) {
        correctSelections.add(gridSymbols.indexOf(symbol));
      }
    });

    if (!correct) {
      _stopTimer();
      await _updateBestScore();
      _endGame();
      return;
    }

    if (selectedSymbols.length == levelSymbols.length) {
      _stopTimer();
      totalTime += stopwatch.elapsedMilliseconds;
      lastValidLevel = level;
      await _updateBestScore();
      level++;
      _startNext();
    }
  }

  void _endGame() {
    setState(() {
      showGrid = false;
      showMessage = true;
      isGameOver = true;
      message =
          "Game Over\nScore : ($lastValidLevel) ${_formatTime(totalTime)}";
    });
  }

  void _startNext() {
    setState(() {
      showMessage = true;
      isGameOver = false;
      message = "Bon travail ! Niveau suivant\n"
          "Score : ($lastValidLevel) ${_formatTime(totalTime)}";
      showGrid = false;
    });
    Timer(const Duration(seconds: 2), () {
      _startLevel();
    });
  }

  Future<void> _updateBestScore() async {
    final prefs = await SharedPreferences.getInstance();
    int bestLevel = prefs.getInt('best_level') ?? 0;
    int bestTime = prefs.getInt('best_time') ?? 99999999;

    if (lastValidLevel > bestLevel ||
        (lastValidLevel == bestLevel && totalTime < bestTime)) {
      await prefs.setInt('best_level', lastValidLevel);
      await prefs.setInt('best_time', totalTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inuka - Niveau $level"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: showMessage
            ? GameResultOverlay(
                message: message,
                isGameOver: isGameOver,
                onRestart: isGameOver
                    ? () {
                        setState(() {
                          level = 1;
                          lastValidLevel = 0;
                          totalTime = 0;
                          showMessage = false;
                          isGameOver = false;
                        });
                        _startLevel();
                      }
                    : null,
              )
            : Stack(
                children: [
                  Positioned.fill(
                    child: !showGrid
                        ? MemorisationPhase(
                            instruction: instruction,
                            symbolPath: levelSymbols[currentIndex],
                            interference: interferences[
                                random.nextInt(interferences.length)],
                          )
                        : GridPhase(
                            gridSymbols: gridSymbols,
                            correctSelections: correctSelections,
                            onSymbolTap: _selectSymbol,
                            instruction: instruction,
                          ),
                  ),
                  if (showGrid)
                    Positioned(
                      top: 8,
                      right: 16,
                      child: Text(currentDisplayTime,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                ],
              ),
      ),
    );
  }
}
