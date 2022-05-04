final performances = Invoice('BigCo', [
  Performance('hamlet', 55),
  Performance('as-like', 35),
  Performance('othello', 40),
]);

class Invoice {
  final String customer;
  final List<Performance> performances;

  Invoice(this.customer, this.performances);
}

class Performance {
  final String playID;
  final int audience;

  Performance(this.playID, this.audience);
}
