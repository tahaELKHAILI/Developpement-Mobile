import 'package:flutter/material.dart';

class TicTacToePage extends StatefulWidget {
  final String player;

  const TicTacToePage({
    super.key,
    required this.player,
  });

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  late List<String> _board;
  late String _currentPlayer;
  String? _winner;
  bool _isDraw = false;

  @override
  void initState() {
    super.initState();

    _board = List.filled(9, '');
    _currentPlayer = 'X';
    _winner = null;
    _isDraw = false;
  }

  void _resetGame() {
    setState(() {
      _board = List.filled(9, '');
      _currentPlayer = 'X';
      _winner = null;
      _isDraw = false;
    });
  }

  void _handleTap(int index) {
    if (_board[index].isNotEmpty || _winner != null || _isDraw) {
      return;
    }

    setState(() {
      _board[index] = _currentPlayer;

      if (_checkWinner(_currentPlayer)) {
        _winner = _currentPlayer;
      } else if (!_board.contains('')) {
        _isDraw = true;
      } else {
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
      }
    });
  }

  bool _checkWinner(String player) {
    const List<List<int>> winLines = [
      // Rows
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],

      // Columns
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],

      // Diagonals
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (final line in winLines) {
      if (_board[line[0]] == player &&
          _board[line[1]] == player &&
          _board[line[2]] == player) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    String statusMessage = 'Turn: $_currentPlayer';

    if (_winner != null) {
      statusMessage = 'Winner: $_winner!';
    } else if (_isDraw) {
      statusMessage = "It's a Draw!";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic-Tac-Toe'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth * 0.9,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome - ${widget.player}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  statusMessage,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: _winner != null
                        ? Colors.green
                        : _isDraw
                        ? Colors.orange
                        : Colors.black,
                  ),
                ),

                const SizedBox(height: 25),

                AspectRatio(
                  aspectRatio: 1,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 9,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _handleTap(index),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              _board[index],
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: _board[index] == 'X'
                                    ? Colors.blue
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 25),

                ElevatedButton.icon(
                  onPressed: _resetGame,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset Game'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 14,
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}