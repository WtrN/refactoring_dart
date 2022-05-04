final plays = <String, Play>{
  'hamlet': Play('Hamlet', 'tragedy'),
  'as-like': Play('As You Like It', 'comedy'),
  'othello': Play('Othello', 'tragedy'),
};

class Play {
  final String name;
  final String type;

  Play(this.name, this.type);
}
